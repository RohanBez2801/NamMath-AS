import test from 'node:test';
import assert from 'node:assert/strict';
import {topics} from '../data.js';
import {preparedNotes} from '../notes.js';
import katex from '../vendor/katex.mjs';
import {findMathExpressions,validateMathText} from '../math.js';
import {readFileSync} from 'node:fs';

test('all 15 notes contain parsed KaTeX formulae and worked examples',()=>{
 let total=0;
 for(const t of topics){
  const note=preparedNotes[t.id];
  for(const field of ['summary','formulas','example','tip','pitfall']){
   const segs=findMathExpressions(note[field]);total+=segs.length;
   assert.deepEqual(validateMathText(note[field]),[],`invalid ${t.id}.${field}`);
  }
  assert.ok(findMathExpressions(note.formulas).length>=2,t.id);
  assert.ok(findMathExpressions(note.example).length>=1,t.id);
 }
 assert.ok(total>=100,`Expected at least 100 expressions; got ${total}`);
});
test('KaTeX renders derivative integral fractions, vectors and matrix correctly',()=>{
 for(const tex of [String.raw`\frac{x+1}{x-2}`,String.raw`\int_0^1 x^2\,\mathrm dx`,String.raw`\frac{\mathrm dy}{\mathrm dx}`,String.raw`\lVert\mathbf a\rVert`,String.raw`\begin{pmatrix}1&2\\3&4\end{pmatrix}`]){
  assert.match(katex.renderToString(tex,{throwOnError:true,trust:false}),/class="katex/);
 }
});
test('malformed TeX is reported for live editor validation',()=>{
 assert.ok(validateMathText(String.raw`$$\frac{1}{$$`).length>0);
 assert.equal(findMathExpressions('N$30 for a month').length,0);
});
test('math rendering does not treat untrusted input as HTML',()=>{
 const js=readFileSync(new URL('../app.js',import.meta.url),'utf8');
 const math=readFileSync(new URL('../math.js',import.meta.url),'utf8');
 assert.match(js,/escapeHtml\(value\|\|'Not added yet.'/);
 assert.match(math,/trust:false/);
 assert.match(math,/textContent/);
});
