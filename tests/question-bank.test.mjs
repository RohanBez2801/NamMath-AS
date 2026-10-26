import test from 'node:test';
import assert from 'node:assert/strict';
import {readFileSync} from 'node:fs';
import {topics, sampleQuestions} from '../data.js';

test('all 15 AS syllabus topics represented (9 Mathematics 1, 6 Mathematics 2)', () => {
 assert.equal(topics.length, 15);
 assert.equal(topics.filter(t => t.paper===1).length,9);
 assert.equal(topics.filter(t => t.paper===2).length,6);
 assert.equal(new Set(topics.map(t=>t.id)).size, 15);
});
test('45 original demo questions; three per topic, one correct answer and four distinct options', () => {
 assert.equal(sampleQuestions.length,45);
 assert.equal(new Set(sampleQuestions.map(q=>q.id)).size,45);
 for(const t of topics){
  assert.equal(sampleQuestions.filter(q=>q.topicId===t.id).length,3,t.id);
 }
 for(const q of sampleQuestions){
  assert.equal(q.options.length,4,q.id);
  assert.equal(new Set(q.options).size,4,q.id);
  assert.ok(Number.isInteger(q.answer)&&q.answer>=0&&q.answer<4,q.id);
  assert.ok(q.prompt.length>10,q.id);
 }
});
test('offline preview never contains premium worked memorandums', () => {
 const js=readFileSync(new URL('../data.js',import.meta.url),'utf8');
 assert.ok(!js.includes('memorandum:'));
 assert.ok(!js.includes('workedSolution:'));
});
test('memo Edge Function requires real subscription dates',()=>{
 const js=readFileSync(new URL('../supabase/functions/nam-math-memo/index.ts',import.meta.url),'utf8');
 assert.match(js,/\.eq\('status','active'\)/);
 assert.match(js,/\.lte\('starts_at'/);
 assert.match(js,/\.gt\('expires_at'/);
 assert.match(js,/nammath_internal_get_answer/);
});
test('in online mode quiz never falls back to client demo answers',()=>{
 const js=readFileSync(new URL('../app.js',import.meta.url),'utf8');
 assert.match(js,/if\(backendConfigured\)return publicQuestionsForTopics\(\[topic\.id\]\)/);
 assert.match(js,/return sampleQuestions.filter\(q=>q.topicId===topic.id\)/); // local practice is an explicit, separate branch
});
