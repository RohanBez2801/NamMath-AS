import test from 'node:test';
import assert from 'node:assert/strict';
import { topics } from '../data.js';
import { preparedNotes } from '../notes.js';
import { mergeCatalogue, resourceKey, pastSlots } from '../library.js';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';
const root=resolve(dirname(fileURLToPath(import.meta.url)),'..');
test('2021–2025 provide precisely ten pre-created P1/P2 paper slots',()=>{
 const slots=pastSlots();assert.equal(slots.length,10);
 assert.deepEqual(slots.map(s=>`${s.year}-P${s.paper}`),['2025-P1','2025-P2','2024-P1','2024-P2','2023-P1','2023-P2','2022-P1','2022-P2','2021-P1','2021-P2']);
 assert.ok(slots.every(s=>!('memo_path'in s)&&!('paper_path'in s)));
});
test('regional mocks appear only after being added, with memo distinct',()=>{
 assert.equal(mergeCatalogue([]).length,10);
 const key=resourceKey('mock',2026,'Khomas',2);
 const merged=mergeCatalogue([{category:'mock',year:2026,region:'Khomas',paper:2,paper_path:'private/a.pdf',memo_path:null}]);
 assert.equal(merged.length,11);assert.equal(merged.find(x=>resourceKey(x.category,x.year,x.region,x.paper)===key).memo_path,null);
});
test('every official topic has an original summary, formula list, worked example, exam tip and pitfall',()=>{
 assert.equal(Object.keys(preparedNotes).length,15);
 for(const t of topics){const n=preparedNotes[t.id];assert.ok(n,`missing ${t.id}`);for(const field of ['summary','formulas','example','tip','pitfall'])assert.ok(typeof n[field]==='string'&&n[field].length>15,`${t.id} ${field}`);}
});
test('security: live documents check server-side entitlement and private Storage',()=>{
 const doc=readFileSync(resolve(root,'supabase/functions/nam-math-document/index.ts'),'utf8');
 const sql=readFileSync(resolve(root,'supabase/migrations/202610260003_nammath_library.sql'),'utf8');
 assert.match(doc,/kind==='memo'/);assert.match(doc,/auth\.getUser\(jwt\)/);assert.match(doc,/nammath_entitlements/);assert.match(doc,/createSignedUrl\(path,45\)/);
 assert.match(sql,/\('nammath-library','nammath-library',false/);assert.match(sql,/nammath_admins/);
});
