-- Original NamMath AS sample questions and protected solution keys.
-- This seed is idempotent and does not change an existing question if its ID is present.

insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-equations',1,1,'Equations, expressions, identities and inequalities','Equations & Inequalities') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-sequences',1,2,'Sequences and series','Sequences & Series') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-graphs',1,3,'Graphs and functions','Graphs & Functions') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-coordinate',1,4,'Coordinate geometry','Coordinate Geometry') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-circular',1,5,'Circular measure','Circular Measure') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-trig',1,6,'Trigonometry','Trigonometry') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-vectors',1,7,'Vectors in three dimensions','3D Vectors') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-diff',1,8,'Differentiation','Differentiation') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m1-integration',1,9,'Integration','Integration') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-algebra',2,1,'Algebra','Further Algebra') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-logs',2,2,'Logarithmic and exponential functions','Logs & Exponentials') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-trig',2,3,'Trigonometry','Further Trigonometry') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-diff',2,4,'Differentiation','Further Differentiation') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-integration',2,5,'Integration','Further Integration') on conflict (id) do nothing;
insert into public.nammath_topics (id,paper,topic_number,title,short_title) values ('m2-numerical',2,6,'Numerical solutions of equations','Numerical Solutions') on conflict (id) do nothing;

insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-equations','m1-equations','Solve 2x² − 5x − 3 = 0.','["x = 3 or x = −½", "x = −3 or x = ½", "x = 1 or x = −3", "x = 3 or x = ½"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-sequences','m1-sequences','The arithmetic sequence is 4, 7, 10, 13, … Find its 20th term.','["57", "60", "61", "64"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-graphs','m1-graphs','If f(x) = 2x − 7, which expression gives the inverse function?','["(x − 7)/2", "(x + 7)/2", "2x + 7", "7 − 2x"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-coordinate','m1-coordinate','Find the gradient of the line through (−2, 5) and (4, −7).','["2", "−½", "−2", "−12"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-circular','m1-circular','Find the area of a sector with radius 6 cm and angle π/3 radians.','["3π cm²", "6π cm²", "12π cm²", "18π cm²"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-trig','m1-trig','Solve 2 sin θ = √3 for 0 ≤ θ ≤ 2π.','["π/3 and 2π/3", "π/6 and 5π/6", "π/3 only", "2π/3 and 4π/3"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-vectors','m1-vectors','Find the magnitude of vector (2, −3, 6).','["√41", "5", "7", "11"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-diff','m1-diff','Differentiate y = 3x⁴ − 2x² + 5 with respect to x.','["12x³ − 2x", "12x³ − 4x", "3x³ − 4x", "12x⁴ − 4x"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-integration','m1-integration','Evaluate ∫(6x² − 4x) dx.','["18x − 4 + C", "2x³ − 4x² + C", "2x³ − 2x² + C", "6x³ − 4x² + C"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-algebra','m2-algebra','Simplify (x² − 9)/(x − 3), given that x ≠ 3.','["x − 3", "x + 3", "x² + 3", "3x"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-logs','m2-logs','Solve log₂(x) = 5.','["10", "25", "32", "64"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-trig','m2-trig','Solve tan x = 1 in the interval 0 ≤ x < π.','["π/4", "π/2", "3π/4", "π/4 and 3π/4"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-diff','m2-diff','Differentiate y = e^(2x) with respect to x.','["e^(2x)", "2xe^(2x)", "2e^(2x)", "e^x"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-integration','m2-integration','Find ∫e^(3x) dx.','["3e^(3x) + C", "e^(3x) + C", "e^(3x)/3 + C", "e^(x³) + C"]'::jsonb) on conflict (id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-numerical','m2-numerical','Using Newton–Raphson for x² − 2 = 0, start with x₀ = 1.5. What is x₁?','["1.25", "1.4167 (approx.)", "1.5000", "1.6667 (approx.)"]'::jsonb) on conflict (id) do nothing;

insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-equations',0,'Factorise the quadratic:
2x² − 5x − 3 = (2x + 1)(x − 3).
Set each factor to zero:
2x + 1 = 0 gives x = −1/2.
x − 3 = 0 gives x = 3.
Final answer: x = 3 or x = −1/2.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-sequences',2,'For an arithmetic progression, uₙ = a + (n − 1)d.
a = 4 and common difference d = 7 − 4 = 3.
u₂₀ = 4 + (20 − 1)(3)
     = 4 + 57 = 61.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-graphs',1,'Write y = 2x − 7.
Interchange x and y: x = 2y − 7.
Rearrange: 2y = x + 7, so y = (x + 7)/2.
Therefore f⁻¹(x) = (x + 7)/2.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-coordinate',2,'Gradient m = (y₂ − y₁)/(x₂ − x₁).
For A(−2,5) and B(4,−7):
m = (−7 − 5)/(4 − (−2))
  = −12/6
  = −2.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-circular',1,'A sector of radius r and angle θ in radians has area A = ½r²θ.
With r = 6 and θ = π/3:
A = ½(6²)(π/3)
  = 18π/3 = 6π cm².') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-trig',0,'2 sin θ = √3 implies sin θ = √3/2.
The reference angle is π/3.
Sine is positive in quadrants I and II.
Therefore θ = π/3 or θ = π − π/3 = 2π/3, for 0 ≤ θ ≤ 2π.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-vectors',2,'For v = (a,b,c), |v| = √(a² + b² + c²).
Here |v| = √[2² + (−3)² + 6²]
= √(4 + 9 + 36) = √49 = 7.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-diff',1,'Differentiate each term using d/dx(xⁿ) = nxⁿ⁻¹.
d/dx(3x⁴) = 12x³.
d/dx(−2x²) = −4x.
d/dx(5) = 0.
Hence dy/dx = 12x³ − 4x.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-integration',2,'Integrate term by term using ∫xⁿ dx = xⁿ⁺¹/(n+1) + C.
∫(6x² − 4x) dx
= 6(x³/3) − 4(x²/2) + C
= 2x³ − 2x² + C.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-algebra',1,'Factorise the numerator as a difference of squares:
x² − 9 = (x − 3)(x + 3).
For x ≠ 3, cancel the common factor (x − 3).
The expression simplifies to x + 3.
Remember the original restriction x ≠ 3.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-logs',2,'Convert logarithmic form to exponential form:
log₂(x) = 5 means 2⁵ = x.
Hence x = 32.
The domain requirement x > 0 is satisfied.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-trig',0,'tan x = 1 has reference angle π/4.
Tangent is positive in quadrants I and III.
Within 0 ≤ x < π, only quadrant I is included.
Thus x = π/4.') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-diff',2,'Apply the chain rule.
Let u = 2x, so du/dx = 2.
Because d(eᵘ)/dx = eᵘ · du/dx,
dy/dx = 2e^(2x).') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-integration',2,'Use the reverse chain rule: ∫e^(ax) dx = e^(ax)/a + C for a ≠ 0.
With a = 3:
∫e^(3x) dx = e^(3x)/3 + C.
Check: differentiating gives e^(3x).') on conflict (question_id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-numerical',1,'Newton–Raphson iteration: xₙ₊₁ = xₙ − f(xₙ)/f′(xₙ).
For f(x) = x² − 2, f′(x) = 2x.
With x₀ = 1.5:
x₁ = 1.5 − (1.5² − 2)/(2×1.5)
    = 1.5 − 0.25/3
    = 1.416666… ≈ 1.4167.') on conflict (question_id) do nothing;


-- 30 additional original questions and premium worked solutions for MVP 0.2.
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-equations-2','m1-equations','Solve the inequality 3x − 7 < 8.','["x < 5", "x > 5", "x < 1/3", "x > 1/3"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-equations-2',0,'Add 7 to both sides: 3x < 15. Divide by positive 3: x < 5.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-equations-3','m1-equations','Factorise x² − 7x + 12.','["(x − 2)(x − 6)", "(x − 3)(x − 4)", "(x + 3)(x + 4)", "(x − 1)(x − 12)"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-equations-3',1,'Find two numbers whose product is 12 and whose sum is −7: −3 and −4. Thus x² − 7x + 12 = (x − 3)(x − 4).') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-sequences-2','m1-sequences','Find the sum of the first 10 terms of 2, 5, 8, 11, … .','["145", "150", "155", "160"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-sequences-2',2,'The sequence is arithmetic, with a = 2, d = 3 and n = 10. Sₙ = n/2[2a + (n−1)d] = 5[4+27] = 155.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-sequences-3','m1-sequences','A geometric progression begins 3, 6, 12, … . Find its sixth term.','["48", "64", "96", "192"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-sequences-3',2,'Here a = 3 and r = 2. The nth term is arⁿ⁻¹. T₆ = 3 × 2⁵ = 96.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-graphs-2','m1-graphs','For f(x)=x²−4, evaluate f(−3).','["−13", "5", "13", "−5"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-graphs-2',1,'Substitute x = −3: f(−3) = (−3)² − 4 = 9 − 4 = 5.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-graphs-3','m1-graphs','The turning point of y = (x − 2)² + 3 is at which point?','["(−2,3)", "(2,−3)", "(2,3)", "(−2,−3)"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-graphs-3',2,'In completed-square form y = (x−h)² + k, the turning point is (h,k). Hence (2,3).') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-coordinate-2','m1-coordinate','Find the midpoint of the line segment joining (2,−4) and (8,6).','["(5,1)", "(3,2)", "(6,2)", "(5,−1)"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-coordinate-2',0,'Midpoint = ((2+8)/2, (−4+6)/2) = (10/2, 2/2) = (5,1).') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-coordinate-3','m1-coordinate','Which line has gradient 3 and passes through (0,−2)?','["y = 3x + 2", "y = −2x + 3", "y = −3x − 2", "y = 3x − 2"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-coordinate-3',3,'Using y = mx + c, m = 3; the y-intercept from (0,−2) is c = −2. Thus y = 3x − 2.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-circular-2','m1-circular','Find the arc length for a circle of radius 4 cm and angle π/2 radians.','["π cm", "2π cm", "4π cm", "8π cm"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-circular-2',1,'Arc length s = rθ, with θ in radians. s = 4 × π/2 = 2π cm.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-circular-3','m1-circular','Convert 150° into radians.','["π/3", "3π/4", "5π/6", "7π/6"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-circular-3',2,'Multiply by π/180. 150° × π/180 = 5π/6 radians.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-trig-2','m1-trig','Evaluate sin 30° + cos 60°.','["0", "1/2", "1", "√3"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-trig-2',2,'sin30° = 1/2 and cos60° = 1/2, so their sum is 1.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-trig-3','m1-trig','Using tan θ = sin θ / cos θ, find tan 45°.','["0", "1", "√2", "√3"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-trig-3',1,'sin45° = cos45° = √2/2. Their ratio is 1.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-vectors-2','m1-vectors','Find (2, −1, 3) + (−1, 4, 0).','["(1,3,3)", "(3,3,3)", "(1,−5,3)", "(−2,−4,0)"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-vectors-2',0,'Add componentwise: (2+−1, −1+4, 3+0) = (1,3,3).') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-vectors-3','m1-vectors','Calculate the dot product (1,2,−1) · (3,0,4).','["7", "−7", "−1", "1"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-vectors-3',2,'Multiply corresponding entries and add: 1×3 + 2×0 + (−1)×4 = 3 − 4 = −1.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-diff-2','m1-diff','Differentiate f(x)=5x³−7x.','["15x²−7", "5x²−7", "15x³−7", "15x²−7x"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-diff-2',0,'By the power rule, d(5x³)/dx = 15x² and d(−7x)/dx = −7. Hence f′(x) = 15x² − 7.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-diff-3','m1-diff','Find the stationary x-coordinates of y=x²−6x+8.','["x = 0", "x = −3", "x = 3", "x = 6"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-diff-3',2,'Differentiate: dy/dx = 2x − 6. At a stationary point dy/dx = 0, so 2x − 6 = 0 and x = 3.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-integration-2','m1-integration','Evaluate ∫4x³ dx.','["x⁴+C", "12x²+C", "4x⁴+C", "x³+C"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-integration-2',0,'Use the integration power rule: ∫4x³dx = 4×(x⁴/4) + C = x⁴ + C.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m1-integration-3','m1-integration','Evaluate the definite integral ∫₀² 3x² dx.','["4", "6", "8", "12"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m1-integration-3',2,'An antiderivative of 3x² is x³. Evaluate [x³]₀² = 2³−0³ = 8.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-algebra-2','m2-algebra','Solve 2^(x+1) = 16.','["2", "3", "4", "5"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-algebra-2',1,'Write 16 = 2⁴. Equate exponents: x + 1 = 4, so x = 3.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-algebra-3','m2-algebra','Simplify (x³y²)/(xy), for x,y ≠ 0.','["x⁴y³", "x²y²", "xy", "x²y"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-algebra-3',3,'Subtract powers in numerator and denominator: x³/x = x², y²/y = y. Result x²y.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-logs-2','m2-logs','Simplify ln(e⁴).','["e⁴", "4e", "4", "1/4"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-logs-2',2,'Natural logarithm and the exponential base e are inverse functions. ln(e⁴) = 4.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-logs-3','m2-logs','Solve 3^x = 81.','["3", "4", "5", "9"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-logs-3',1,'Since 81 = 3⁴, x = 4.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-trig-2','m2-trig','Evaluate cos(2×30°).','["1/2", "√3/2", "0", "1"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-trig-2',0,'2×30° = 60°. cos60° = 1/2.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-trig-3','m2-trig','Solve sin x = 0 on 0 ≤ x ≤ 2π.','["0, π only", "π/2,3π/2", "0,π,2π", "π/2 only"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-trig-3',2,'Sine vanishes along the x-axis: x = 0, π, 2π within the closed interval.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-diff-2','m2-diff','Differentiate y=ln x (x>0).','["ln x", "x", "1/x", "e^x"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-diff-2',2,'The derivative of the natural logarithm is d(ln x)/dx = 1/x for x>0.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-diff-3','m2-diff','Differentiate y=(3x+1)⁴.','["4(3x+1)³", "12(3x+1)³", "12(3x+1)⁴", "(3x+1)³"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-diff-3',1,'Use the chain rule: outer derivative 4(3x+1)³, multiplied by the inner derivative 3. Answer = 12(3x+1)³.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-integration-2','m2-integration','Evaluate ∫ 1/x dx for x>0.','["1/x² + C", "x²/2 + C", "ln x + C", "e^x + C"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-integration-2',2,'For x>0, an antiderivative of 1/x is ln x. Thus the integral equals ln x + C.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-integration-3','m2-integration','Evaluate ∫ 2cos(2x) dx.','["2sin(2x)+C", "sin(2x)+C", "−sin(2x)+C", "cos(2x)+C"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-integration-3',1,'Because d(sin(2x))/dx = 2cos(2x), the integral is sin(2x)+C.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-numerical-2','m2-numerical','Apply one Newton–Raphson step to f(x)=x²−4 using x₀=3. What is x₁?','["2", "2.5", "13/6", "7/3"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-numerical-2',2,'f′(x) = 2x. Newton step x₁ = x₀ − f(x₀)/f′(x₀) = 3 − (9−4)/6 = 3−5/6 = 13/6.') on conflict (question_id) do nothing;
insert into public.nammath_questions (id,topic_id,prompt,options) values ('q-m2-numerical-3','m2-numerical','Using xₙ₊₁=(xₙ+2/xₙ)/2 to approximate √2, find x₁ from x₀=2.','["1", "1.5", "1.25", "2.5"]'::jsonb) on conflict (id) do nothing;
insert into nammath_private.nammath_answers (question_id,correct_option,memorandum) values ('q-m2-numerical-3',1,'Substitute x₀ = 2: x₁ = (2 + 2/2)/2 = (2+1)/2 = 1.5.') on conflict (question_id) do nothing;
