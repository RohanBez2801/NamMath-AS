// Resource catalogue utilities: public metadata only (never PDF bytes or memorandums).
export const YEARS = [2025,2024,2023,2022,2021];
export function resourceKey(category,year,region,paper){return `${category}:${year}:${(region||'').trim().toLowerCase()}:${paper}`;}
export function pastSlots(){return YEARS.flatMap(year=>[1,2].map(paper=>({category:'past',year,region:'',paper,resource_key:resourceKey('past',year,'',paper)})));}
export function regionalSlots(rows){return rows.filter(r=>r.category==='mock'&&r.year===2026).sort((a,b)=>(a.region||'').localeCompare(b.region||'')||a.paper-b.paper);}
export function mergeCatalogue(rows){const map = new Map((rows||[]).map(r=>[resourceKey(r.category,r.year,r.region,r.paper),r]));return [...pastSlots().map(s=>({...s,...map.get(s.resource_key)})),...regionalSlots(rows||[])];}
const DB_NAME='nammath-library-preview-v3';
const sessionFiles=new Map();
function requestToPromise(req){return new Promise((resolve,reject)=>{req.onsuccess=()=>resolve(req.result);req.onerror=()=>reject(req.error);});}
export async function openPreviewDb(){return new Promise((resolve,reject)=>{const r=indexedDB.open(DB_NAME,1);r.onupgradeneeded=()=>r.result.createObjectStore('pdfs');r.onsuccess=()=>resolve(r.result);r.onerror=()=>reject(r.error);});}
export async function storePreviewPdf(key,file){try{const db=await openPreviewDb();try{const tx=db.transaction('pdfs','readwrite');await requestToPromise(tx.objectStore('pdfs').put(file,key));await new Promise((resolve,reject)=>{tx.oncomplete=resolve;tx.onerror=()=>reject(tx.error);tx.onabort=()=>reject(tx.error);});return 'device';}finally{db.close();}}catch{sessionFiles.set(key,file);return 'session';}}
export async function loadPreviewPdf(key){if(sessionFiles.has(key))return sessionFiles.get(key);try{const db=await openPreviewDb();try{return await requestToPromise(db.transaction('pdfs').objectStore('pdfs').get(key));}finally{db.close();}}catch{return null;}}
export async function validatePdf(file){if(!file || file.size<5 || file.size>20*1024*1024)return 'Choose a PDF up to 20 MB.';if(!file.name.toLowerCase().endsWith('.pdf'))return 'The selected file must have a .pdf extension.';const header=new TextDecoder().decode(await file.slice(0,5).arrayBuffer());if(header!=='%PDF-')return 'File content does not appear to be a valid PDF.';return null;}
