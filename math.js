import katex from './vendor/katex.mjs';

export const MATH_DELIMITERS = [
  {left:'$$',right:'$$',display:true},
  {left:'\\[',right:'\\]',display:true},
  {left:'\\(',right:'\\)',display:false},
  {left:'$',right:'$',display:false}
];

// Each match is contained in one text node; editors keep each equation on a line.
const mathRegex = /(\$\$([^$\n]+?)\$\$|\\\[([^\n]+?)\\\]|\\\(([^\n]+?)\\\)|(?<!\\)\$([^$\n]+?)\$)/g;
const options = {trust:false,strict:'warn',maxExpand:300,maxSize:10,throwOnError:false,output:'htmlAndMathml'};

export function findMathExpressions(text) {
  return [...String(text??'').matchAll(new RegExp(mathRegex.source,'g'))].map(match => ({
    expression:match[2]??match[3]??match[4]??match[5],
    display:match[2]!==undefined||match[3]!==undefined,
    start:match.index,end:match.index+match[0].length
  }));
}
export function validateMathText(text) {
 const errors=[];
 const value=String(text??'');
 const count=token=>(value.match(token)||[]).length;
 if(count(/\$\$/g)%2)errors.push('Unmatched $$ display-math delimiter');
 if(count(/\\\[/g)!==count(/\\\]/g))errors.push('Unmatched \\[ ... \\] delimiter');
 if(count(/\\\(/g)!==count(/\\\)/g))errors.push('Unmatched \\( ... \\) delimiter');
 for(const segment of findMathExpressions(text)){
   try {katex.renderToString(segment.expression,{...options,throwOnError:true,displayMode:segment.display});}
   catch(e){errors.push(`$${segment.expression.slice(0,42)}: ${e.message}`)}
 }
 return errors;
}
function shouldIgnore(node){return Boolean(node.parentElement?.closest('pre,code,textarea,script,style,option,.katex,.katex-display'))}
function renderNode(node){
 const value=node.textContent||'';
 const expressions=findMathExpressions(value);
 if(!expressions.length)return;
 const fragment=document.createDocumentFragment();let offset=0;
 for(const segment of expressions){
   if(segment.start>offset)fragment.append(document.createTextNode(value.slice(offset,segment.start)));
   const span=document.createElement('span');span.className=segment.display?'math-display':'math-inline';
   try{katex.render(segment.expression,span,{...options,displayMode:segment.display});}
   catch(e){span.textContent=segment.expression;span.classList.add('math-invalid');}
   fragment.append(span);offset=segment.end;
 }
 if(offset<value.length)fragment.append(document.createTextNode(value.slice(offset)));
 node.replaceWith(fragment);
}
export function typesetNotes(root=document){
 if(!root)return;
 const targets = root.matches?.('.math-content') ? [root] : [...root.querySelectorAll('.math-content')];
 for(const target of targets){
   const walker=document.createTreeWalker(target,NodeFilter.SHOW_TEXT);
   const textNodes=[];while(walker.nextNode())if(!shouldIgnore(walker.currentNode))textNodes.push(walker.currentNode);
   for(const node of textNodes)renderNode(node);
 }
}
