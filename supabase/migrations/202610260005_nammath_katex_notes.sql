-- KaTeX v0.4: upgrade ONLY untouched formula and example drafts from v0.3.
-- Previously edited formula/example text is never overwritten.
-- Apply after migrations ending in 004.
begin;
update public.nammath_notes set formulas='$$(a+b)^2=a^2+2ab+b^2$$
$$(a-b)^2=a^2-2ab+b^2$$
$$ax^2+bx+c=0\quad\Rightarrow\quad x=\frac{-b\pm\sqrt{b^2-4ac}}{2a}$$', example='Solve \(x^2-5x+6=0\).
$$x^2-5x+6=(x-2)(x-3)=0$$
Therefore, \(x=2\) or \(x=3\).', summary='Manipulate algebraic expressions before solving equations and inequalities. Distinguish an equation (true for particular values), an identity (true for all permitted values) and an inequality. Always check restrictions introduced by denominators or radicals.' where topic_id='m1-equations' and formulas='(a + b)² = a² + 2ab + b²
(a − b)² = a² − 2ab + b²
ax² + bx + c = 0 ⇒ x = (−b ± √(b² − 4ac))/(2a)' and example='Solve x² − 5x + 6 = 0. Factorise: (x − 2)(x − 3) = 0, so x = 2 or x = 3.' and summary='Manipulate algebraic expressions before solving equations and inequalities. Distinguish an equation (true for particular values), an identity (true for all permitted values) and an inequality. Always check restrictions introduced by denominators or radicals.';
update public.nammath_notes set formulas='Arithmetic progression:
$$u_n=a+(n-1)d$$
$$S_n=\frac{n}{2}[2a+(n-1)d]$$
Geometric progression:
$$u_n=ar^{n-1}$$
$$S_n=\frac{a(1-r^n)}{1-r}\quad(r\ne1)$$
$$S_{\infty}=\frac{a}{1-r}\quad(|r|<1)$$', example='The sequence \(3,6,12,\dots\) has \(a=3\), \(r=2\).
$$u_5=3\cdot2^4=48$$', summary='An arithmetic progression has a constant difference d, while a geometric progression has a constant ratio r. Identify the sequence type before selecting the term or sum formula. For an infinite geometric series, convergence requires \(|r|<1\).' where topic_id='m1-sequences' and formulas='AP: uₙ = a + (n − 1)d
AP: Sₙ = n[2a + (n − 1)d]/2
GP: uₙ = arⁿ⁻¹
GP: Sₙ = a(1 − rⁿ)/(1 − r), r ≠ 1
GP infinity: S∞ = a/(1 − r), |r| < 1' and example='For 3, 6, 12, … we have a = 3 and r = 2. The fifth term is u₅ = 3(2⁴) = 48.' and summary='An arithmetic progression has a constant difference d, while a geometric progression has a constant ratio r. Identify the sequence type before selecting the term or sum formula. For an infinite geometric series, convergence requires |r| < 1.';
update public.nammath_notes set formulas='Translation:
$$y=f(x-a)+b$$
Reflection in the x-axis:
$$y=-f(x)$$
Inverse relation: interchange \(x\) and \(y\), then solve for \(y\).', example='Find the inverse of \(f(x)=2x-3\):
$$y=2x-3\Rightarrow x=2y-3$$
$$f^{-1}(x)=\frac{x+3}{2}$$', summary='A function maps inputs in its domain to outputs. Read intercepts, symmetry, turning points, asymptotes and transformations from the rule or graph. Inverse functions reverse the mapping on a suitable restricted domain.' where topic_id='m1-graphs' and formulas='Translation: y = f(x − a) + b shifts by (a, b)
Reflection in x-axis: y = −f(x)
Inverse relation: interchange x and y, then solve for y' and example='If f(x) = 2x − 3, let y = 2x − 3. Swap variables: x = 2y − 3, hence f⁻¹(x) = (x + 3)/2.' and summary='A function maps inputs in its domain to outputs. Read intercepts, symmetry, turning points, asymptotes and transformations from the rule or graph. Inverse functions reverse the mapping on a suitable restricted domain.';
update public.nammath_notes set formulas='Gradient:
$$m=\frac{y_2-y_1}{x_2-x_1}$$
Point-gradient form:
$$y-y_1=m(x-x_1)$$
Midpoint:
$$M=\left(\frac{x_1+x_2}{2},\frac{y_1+y_2}{2}\right)$$
Distance:
$$d=\sqrt{(x_2-x_1)^2+(y_2-y_1)^2}$$', example='Through \((1,2)\) and \((3,6)\):
$$m=\frac{6-2}{3-1}=2$$
$$y-2=2(x-1)\Rightarrow y=2x$$', summary='Coordinate geometry links algebraic equations with line properties. Gradient measures steepness; parallel lines have equal gradients and perpendicular non-vertical lines have gradients whose product is −1.' where topic_id='m1-coordinate' and formulas='m = (y₂ − y₁)/(x₂ − x₁)
y − y₁ = m(x − x₁)
Midpoint = ((x₁ + x₂)/2, (y₁ + y₂)/2)
Distance = √[(x₂ − x₁)² + (y₂ − y₁)²]' and example='Through (1, 2) and (3, 6), m = (6 − 2)/(3 − 1) = 2, so y − 2 = 2(x − 1), or y = 2x.' and summary='Coordinate geometry links algebraic equations with line properties. Gradient measures steepness; parallel lines have equal gradients and perpendicular non-vertical lines have gradients whose product is −1.';
update public.nammath_notes set formulas='$$180^\circ=\pi\text{ radians}$$
Arc length, with \(\theta\) in radians:
$$s=r\theta$$
Sector area:
$$A=\frac12 r^2\theta$$', example='For \(r=6\text{ cm}\), \(\theta=\frac\pi3\):
$$s=6\cdot\frac\pi3=2\pi\text{ cm}$$
$$A=\frac12(6)^2\cdot\frac\pi3=6\pi\text{ cm}^2$$', summary='Radian measure links an angle to the arc of a circle. Convert degrees to radians when required, and use radians for arc-length and sector-area formulas.' where topic_id='m1-circular' and formulas='180° = π radians
Arc length s = rθ
Sector area A = ½r²θ' and example='A sector has r = 6 cm and θ = π/3. Its arc length is 6π/3 = 2π cm, and area is ½(36)(π/3) = 6π cm².' and summary='Radian measure links an angle to the arc of a circle. Convert degrees to radians when required, and use radians for arc-length and sector-area formulas.';
update public.nammath_notes set formulas='$$\sin^2\theta+\cos^2\theta=1$$
$$\tan\theta=\frac{\sin\theta}{\cos\theta}\quad(\cos\theta\ne0)$$
$$\sin(-\theta)=-\sin\theta$$
$$\cos(-\theta)=\cos\theta$$', example='Solve \(\sin\theta=\frac12\) for \(0^\circ\le\theta\le360^\circ\).
Reference angle \(30^\circ\). Solutions:
$$\theta=30^\circ,\ 150^\circ$$', summary='Trigonometric ratios connect angles and side lengths; unit-circle symmetry helps solve equations over a stated interval. Sketch or reason about the sign of sine, cosine and tangent in each quadrant.' where topic_id='m1-trig' and formulas='sin²θ + cos²θ = 1
tan θ = sin θ / cos θ, cos θ ≠ 0
sin(−θ) = −sin θ; cos(−θ) = cos θ' and example='Solve sin θ = ½ for 0° ≤ θ ≤ 360°. The reference angle is 30°, giving θ = 30° and θ = 150°.' and summary='Trigonometric ratios connect angles and side lengths; unit-circle symmetry helps solve equations over a stated interval. Sketch or reason about the sign of sine, cosine and tangent in each quadrant.';
update public.nammath_notes set formulas='Magnitude:
$$\lVert\mathbf a\rVert=\sqrt{a_1^2+a_2^2+a_3^2}$$
Dot product:
$$\mathbf a\cdot\mathbf b=a_1b_1+a_2b_2+a_3b_3$$
Angle between vectors:
$$\mathbf a\cdot\mathbf b=\lVert\mathbf a\rVert\lVert\mathbf b\rVert\cos\theta$$', example='For \(\mathbf a=(2,-1,2)\):
$$\lVert\mathbf a\rVert=\sqrt{2^2+(-1)^2+2^2}=3$$', summary='A three-dimensional vector describes displacement in x, y and z directions. Work component by component to add vectors, calculate magnitude or find a dot product.' where topic_id='m1-vectors' and formulas='|a| = √(a₁² + a₂² + a₃²)
a · b = a₁b₁ + a₂b₂ + a₃b₃
a · b = |a||b|cos θ' and example='For a = (2, −1, 2), |a| = √(4 + 1 + 4) = 3.' and summary='A three-dimensional vector describes displacement in x, y and z directions. Work component by component to add vectors, calculate magnitude or find a dot product.';
update public.nammath_notes set formulas='Power rule:
$$\frac{\mathrm d}{\mathrm dx}x^n=nx^{n-1}$$
Stationary points:
$$f''(x)=0$$
$$f''''(x)>0\Rightarrow\text{local minimum}$$
$$f''''(x)<0\Rightarrow\text{local maximum}$$
Motion:
$$v=\frac{\mathrm ds}{\mathrm dt},\quad a=\frac{\mathrm dv}{\mathrm dt}$$', example='For \(f(x)=x^2-6x+5\):
$$f''(x)=2x-6=0\Rightarrow x=3$$
$$f(3)=-4,\quad f''''(x)=2>0$$
Therefore, \((3,-4)\) is a local minimum.', summary='Differentiation gives the instantaneous rate of change or tangent gradient. Use derivatives to find stationary points, tangent equations and maxima or minima. In motion problems, velocity is the derivative of displacement.' where topic_id='m1-diff' and formulas='d(xⁿ)/dx = nxⁿ⁻¹
Stationary point: f′(x) = 0
If f″(x) > 0: local minimum; if f″(x) < 0: local maximum
v = ds/dt, a = dv/dt' and example='For f(x) = x² − 6x + 5, f′(x) = 2x − 6 = 0 at x = 3. f(3) = −4 and f″(x) = 2 > 0, so (3, −4) is a minimum.' and summary='Differentiation gives the instantaneous rate of change or tangent gradient. Use derivatives to find stationary points, tangent equations and maxima or minima. In motion problems, velocity is the derivative of displacement.';
update public.nammath_notes set formulas='Power rule (\(n\ne-1\)):
$$\int x^n\,\mathrm dx=\frac{x^{n+1}}{n+1}+C$$
Fundamental theorem:
$$\int_a^b f(x)\,\mathrm dx=F(b)-F(a)$$
Split at roots when geometric area crosses the x-axis.', example='Find the indefinite integral:
$$\int(6x^2-4x)\,\mathrm dx=2x^3-2x^2+C$$', summary='Integration reverses differentiation and can calculate accumulated change or signed area. Indefinite integrals need a constant \(C\); definite integrals use upper and lower limits.' where topic_id='m1-integration' and formulas='∫xⁿ dx = xⁿ⁺¹/(n + 1) + C, n ≠ −1
∫ₐᵇ f(x) dx = F(b) − F(a)
Area between curve and x-axis may require splitting at roots' and example='∫(6x² − 4x) dx = 2x³ − 2x² + C.' and summary='Integration reverses differentiation and can calculate accumulated change or signed area. Indefinite integrals need a constant C; definite integrals use upper and lower limits.';
update public.nammath_notes set formulas='Difference of squares:
$$a^2-b^2=(a-b)(a+b)$$
Divide fractions (nonzero denominators):
$$\frac ab\div\frac cd=\frac{ad}{bc}$$
Quadratic discriminant:
$$\Delta=b^2-4ac$$', example='Simplify while keeping the restriction:
$$\frac{x^2-9}{x-3}=\frac{(x-3)(x+3)}{x-3}=x+3$$
Valid only when \(x\ne3\).', summary='Further algebra builds accuracy with rearranging, factorisation, equations and restrictions. Choose a method that preserves equivalence and identify values for which the original expression is undefined.' where topic_id='m2-algebra' and formulas='a² − b² = (a − b)(a + b)
(a/b) ÷ (c/d) = ad/(bc), provided all denominators are nonzero
For quadratics, discriminant Δ = b² − 4ac' and example='(x² − 9)/(x − 3) = [(x − 3)(x + 3)]/(x − 3) = x + 3 for x ≠ 3.' and summary='Further algebra builds accuracy with rearranging, factorisation, equations and restrictions. Choose a method that preserves equivalence and identify values for which the original expression is undefined.';
update public.nammath_notes set formulas='For \(a>0\), \(a\ne1\), and positive arguments:
$$\log_a(xy)=\log_a x+\log_a y$$
$$\log_a\!\left(\frac{x}{y}\right)=\log_a x-\log_a y$$
$$\log_a(x^n)=n\log_a x$$
$$\ln(e^x)=x,\qquad e^{\ln x}=x\;(x>0)$$', example='Solve \(\ln x=2\):
$$\ln x=2\Rightarrow x=e^2$$', summary='Exponential and logarithmic functions are inverses. Their laws simplify products, quotients and powers, but logarithm arguments must be strictly positive (\(x>0\)).' where topic_id='m2-logs' and formulas='logₐ(xy) = logₐ x + logₐ y
logₐ(x/y) = logₐ x − logₐ y
logₐ(xⁿ) = n logₐ x
ln(eˣ) = x; e^(ln x) = x for x > 0' and example='Solve ln x = 2: exponentiate both sides to get x = e².' and summary='Exponential and logarithmic functions are inverses. Their laws simplify products, quotients and powers, but logarithm arguments must be strictly positive.';
update public.nammath_notes set formulas='$$\sin 2x=2\sin x\cos x$$
$$\cos 2x=\cos^2 x-\sin^2 x$$
$$\cos 2x=1-2\sin^2 x$$
$$1+\tan^2 x=\sec^2 x$$', example='Solve \(\cos2x=0\) for \(0^\circ\le x<180^\circ\).
$$2x=90^\circ\text{ or }270^\circ$$
$$x=45^\circ\text{ or }135^\circ$$', summary='Further trigonometry extends identities and equation solving. Rearrange carefully, factor when possible and identify all angles satisfying both the identity and the interval.' where topic_id='m2-trig' and formulas='sin 2x = 2sin x cos x
cos 2x = cos²x − sin²x = 1 − 2sin²x
1 + tan²x = sec²x (where defined)' and example='Solve cos 2x = 0 for 0° ≤ x < 180°. Then 2x = 90° or 270°, so x = 45° or 135°.' and summary='Further trigonometry extends identities and equation solving. Rearrange carefully, factor when possible and identify all angles satisfying both the identity and the interval.';
update public.nammath_notes set formulas='Chain rule:
$$\frac{\mathrm d}{\mathrm dx}f(g(x))=f''(g(x))g''(x)$$
Product rule:
$$(uv)''=u''v+uv''$$
Quotient rule (\(v\ne0\)):
$$\left(\frac uv\right)''=\frac{vu''-uv''}{v^2}$$
$$\frac{\mathrm d}{\mathrm dx}e^x=e^x,\quad\frac{\mathrm d}{\mathrm dx}\ln x=\frac1x\;(x>0)$$', example='Differentiate \(y=(3x+1)^4\):
$$\frac{\mathrm dy}{\mathrm dx}=4(3x+1)^3\cdot3=12(3x+1)^3$$', summary='Further differentiation combines chain, product and quotient rules with logarithmic and exponential functions. It supports more sophisticated tangents, stationary points and related rates of change.' where topic_id='m2-diff' and formulas='Chain rule: d[f(g(x))]/dx = f′(g(x))g′(x)
Product rule: (uv)′ = u′v + uv′
Quotient rule: (u/v)′ = (vu′ − uv′)/v²
d(eˣ)/dx = eˣ; d(ln x)/dx = 1/x (x > 0)' and example='For y = (3x + 1)⁴, y′ = 4(3x + 1)³ · 3 = 12(3x + 1)³.' and summary='Further differentiation combines chain, product and quotient rules with logarithmic and exponential functions. It supports more sophisticated tangents, stationary points and related rates of change.';
update public.nammath_notes set formulas='For \(a\ne0\):
$$\int e^{ax}\,\mathrm dx=\frac{e^{ax}}a+C$$
$$\int\frac1x\,\mathrm dx=\ln|x|+C$$
$$\int\cos(ax)\,\mathrm dx=\frac{\sin(ax)}a+C$$
About the x-axis:
$$V=\pi\int_a^b[y(x)]^2\,\mathrm dx$$', example='Evaluate:
$$\int 2\cos(2x)\,\mathrm dx=\sin(2x)+C$$', summary='Further integration includes standard exponential, logarithmic and trigonometric integrals, often after a substitution. Use definite integration for areas and, where specified, solids of revolution.' where topic_id='m2-integration' and formulas='∫e^(ax) dx = e^(ax)/a + C (a ≠ 0)
∫(1/x) dx = ln|x| + C
∫cos(ax) dx = sin(ax)/a + C
Volume about x-axis: V = π∫ₐᵇ[y(x)]² dx' and example='∫2cos(2x) dx = sin(2x) + C.' and summary='Further integration includes standard exponential, logarithmic and trigonometric integrals, often after a substitution. Use definite integration for areas and, where specified, solids of revolution.';
update public.nammath_notes set formulas='Fixed-point iteration:
$$x_{n+1}=g(x_n)$$
Newton–Raphson method:
$$x_{n+1}=x_n-\frac{f(x_n)}{f''(x_n)}$$', example='For \(f(x)=x^2-2\), start with \(x_0=1.5\):
$$x_1=1.5-\frac{1.5^2-2}{2(1.5)}\approx1.41667$$', summary='Numerical methods estimate roots when exact algebraic solutions are difficult. Iteration produces successive approximations; Newton–Raphson uses the tangent to improve an estimate. Confirm that estimates meet the required accuracy.' where topic_id='m2-numerical' and formulas='Fixed-point iteration: xₙ₊₁ = g(xₙ)
Newton–Raphson: xₙ₊₁ = xₙ − f(xₙ)/f′(xₙ)' and example='To solve x² − 2 = 0 with x₀ = 1.5: x₁ = 1.5 − (1.5² − 2)/(2 × 1.5) ≈ 1.41667.' and summary='Numerical methods estimate roots when exact algebraic solutions are difficult. Iteration produces successive approximations; Newton–Raphson uses the tangent to improve an estimate. Confirm that estimates meet the required accuracy.';
commit;
