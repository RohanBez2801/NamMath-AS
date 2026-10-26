// Original AS mathematics study notes with KaTeX/LaTeX in formulas and examples.
// Use \( ... \) for inline math and $$ ... $$ for displayed equations.
// Render only via text-safe math renderer; never treat note strings as trusted HTML.
export const preparedNotes = {
  "m1-equations": {
    "summary": "Manipulate algebraic expressions before solving equations and inequalities. Distinguish an equation (true for particular values), an identity (true for all permitted values) and an inequality. Always check restrictions introduced by denominators or radicals.",
    "formulas": "$$(a+b)^2=a^2+2ab+b^2$$\n$$(a-b)^2=a^2-2ab+b^2$$\n$$ax^2+bx+c=0\\quad\\Rightarrow\\quad x=\\frac{-b\\pm\\sqrt{b^2-4ac}}{2a}$$",
    "example": "Solve \\(x^2-5x+6=0\\).\n$$x^2-5x+6=(x-2)(x-3)=0$$\nTherefore, \\(x=2\\) or \\(x=3\\).",
    "tip": "Show each transformation and check both solutions in the original equation. For inequalities, reverse the sign when multiplying or dividing by a negative quantity.",
    "pitfall": "Cancelling a factor without recording excluded values may lose or introduce solutions."
  },
  "m1-sequences": {
    "summary": "An arithmetic progression has a constant difference d, while a geometric progression has a constant ratio r. Identify the sequence type before selecting the term or sum formula. For an infinite geometric series, convergence requires \\(|r|<1\\).",
    "formulas": "Arithmetic progression:\n$$u_n=a+(n-1)d$$\n$$S_n=\\frac{n}{2}[2a+(n-1)d]$$\nGeometric progression:\n$$u_n=ar^{n-1}$$\n$$S_n=\\frac{a(1-r^n)}{1-r}\\quad(r\\ne1)$$\n$$S_{\\infty}=\\frac{a}{1-r}\\quad(|r|<1)$$",
    "example": "The sequence \\(3,6,12,\\dots\\) has \\(a=3\\), \\(r=2\\).\n$$u_5=3\\cdot2^4=48$$",
    "tip": "Write down a, d or r explicitly. For infinite sums, state the convergence condition before substituting.",
    "pitfall": "Using the infinite geometric-series formula when |r| ≥ 1."
  },
  "m1-graphs": {
    "summary": "A function maps inputs in its domain to outputs. Read intercepts, symmetry, turning points, asymptotes and transformations from the rule or graph. Inverse functions reverse the mapping on a suitable restricted domain.",
    "formulas": "Translation:\n$$y=f(x-a)+b$$\nReflection in the x-axis:\n$$y=-f(x)$$\nInverse relation: interchange \\(x\\) and \\(y\\), then solve for \\(y\\).",
    "example": "Find the inverse of \\(f(x)=2x-3\\):\n$$y=2x-3\\Rightarrow x=2y-3$$\n$$f^{-1}(x)=\\frac{x+3}{2}$$",
    "tip": "Label important coordinates, state domain restrictions, and check whether an inverse is a function.",
    "pitfall": "Confusing horizontal changes inside f(·) with vertical changes outside it."
  },
  "m1-coordinate": {
    "summary": "Coordinate geometry links algebraic equations with line properties. Gradient measures steepness; parallel lines have equal gradients and perpendicular non-vertical lines have gradients whose product is −1.",
    "formulas": "Gradient:\n$$m=\\frac{y_2-y_1}{x_2-x_1}$$\nPoint-gradient form:\n$$y-y_1=m(x-x_1)$$\nMidpoint:\n$$M=\\left(\\frac{x_1+x_2}{2},\\frac{y_1+y_2}{2}\\right)$$\nDistance:\n$$d=\\sqrt{(x_2-x_1)^2+(y_2-y_1)^2}$$",
    "example": "Through \\((1,2)\\) and \\((3,6)\\):\n$$m=\\frac{6-2}{3-1}=2$$\n$$y-2=2(x-1)\\Rightarrow y=2x$$",
    "tip": "Substitute a given point back into your line equation to verify the constant term.",
    "pitfall": "Reversing the y-coordinate order without also reversing the x-coordinate order."
  },
  "m1-circular": {
    "summary": "Radian measure links an angle to the arc of a circle. Convert degrees to radians when required, and use radians for arc-length and sector-area formulas.",
    "formulas": "$$180^\\circ=\\pi\\text{ radians}$$\nArc length, with \\(\\theta\\) in radians:\n$$s=r\\theta$$\nSector area:\n$$A=\\frac12 r^2\\theta$$",
    "example": "For \\(r=6\\text{ cm}\\), \\(\\theta=\\frac\\pi3\\):\n$$s=6\\cdot\\frac\\pi3=2\\pi\\text{ cm}$$\n$$A=\\frac12(6)^2\\cdot\\frac\\pi3=6\\pi\\text{ cm}^2$$",
    "tip": "Check your calculator angle mode; attach units to length and area answers.",
    "pitfall": "Substituting degrees directly into s = rθ or A = ½r²θ."
  },
  "m1-trig": {
    "summary": "Trigonometric ratios connect angles and side lengths; unit-circle symmetry helps solve equations over a stated interval. Sketch or reason about the sign of sine, cosine and tangent in each quadrant.",
    "formulas": "$$\\sin^2\\theta+\\cos^2\\theta=1$$\n$$\\tan\\theta=\\frac{\\sin\\theta}{\\cos\\theta}\\quad(\\cos\\theta\\ne0)$$\n$$\\sin(-\\theta)=-\\sin\\theta$$\n$$\\cos(-\\theta)=\\cos\\theta$$",
    "example": "Solve \\(\\sin\\theta=\\frac12\\) for \\(0^\\circ\\le\\theta\\le360^\\circ\\).\nReference angle \\(30^\\circ\\). Solutions:\n$$\\theta=30^\\circ,\\ 150^\\circ$$",
    "tip": "State every solution in the specified interval and check if the interval endpoints are included.",
    "pitfall": "Giving only the principal calculator angle and overlooking other quadrants."
  },
  "m1-vectors": {
    "summary": "A three-dimensional vector describes displacement in x, y and z directions. Work component by component to add vectors, calculate magnitude or find a dot product.",
    "formulas": "Magnitude:\n$$\\lVert\\mathbf a\\rVert=\\sqrt{a_1^2+a_2^2+a_3^2}$$\nDot product:\n$$\\mathbf a\\cdot\\mathbf b=a_1b_1+a_2b_2+a_3b_3$$\nAngle between vectors:\n$$\\mathbf a\\cdot\\mathbf b=\\lVert\\mathbf a\\rVert\\lVert\\mathbf b\\rVert\\cos\\theta$$",
    "example": "For \\(\\mathbf a=(2,-1,2)\\):\n$$\\lVert\\mathbf a\\rVert=\\sqrt{2^2+(-1)^2+2^2}=3$$",
    "tip": "Use consistent vector notation and check dimensions before interpreting an angle or projection.",
    "pitfall": "Treating vectors as ordinary numbers or dropping a negative component in a dot product."
  },
  "m1-diff": {
    "summary": "Differentiation gives the instantaneous rate of change or tangent gradient. Use derivatives to find stationary points, tangent equations and maxima or minima. In motion problems, velocity is the derivative of displacement.",
    "formulas": "Power rule:\n$$\\frac{\\mathrm d}{\\mathrm dx}x^n=nx^{n-1}$$\nStationary points:\n$$f'(x)=0$$\n$$f''(x)>0\\Rightarrow\\text{local minimum}$$\n$$f''(x)<0\\Rightarrow\\text{local maximum}$$\nMotion:\n$$v=\\frac{\\mathrm ds}{\\mathrm dt},\\quad a=\\frac{\\mathrm dv}{\\mathrm dt}$$",
    "example": "For \\(f(x)=x^2-6x+5\\):\n$$f'(x)=2x-6=0\\Rightarrow x=3$$\n$$f(3)=-4,\\quad f''(x)=2>0$$\nTherefore, \\((3,-4)\\) is a local minimum.",
    "tip": "For rates of change, write what each derivative represents and include units. For optimisation, classify your stationary point.",
    "pitfall": "Confusing the coordinate of a turning point with its derivative, which is zero there."
  },
  "m1-integration": {
    "summary": "Integration reverses differentiation and can calculate accumulated change or signed area. Indefinite integrals need a constant \\(C\\); definite integrals use upper and lower limits.",
    "formulas": "Power rule (\\(n\\ne-1\\)):\n$$\\int x^n\\,\\mathrm dx=\\frac{x^{n+1}}{n+1}+C$$\nFundamental theorem:\n$$\\int_a^b f(x)\\,\\mathrm dx=F(b)-F(a)$$\nSplit at roots when geometric area crosses the x-axis.",
    "example": "Find the indefinite integral:\n$$\\int(6x^2-4x)\\,\\mathrm dx=2x^3-2x^2+C$$",
    "tip": "Differentiate an indefinite integral result to check it. For area, consider where the integrand is negative.",
    "pitfall": "Forgetting +C, or treating a signed integral as always equal to geometric area."
  },
  "m2-algebra": {
    "summary": "Further algebra builds accuracy with rearranging, factorisation, equations and restrictions. Choose a method that preserves equivalence and identify values for which the original expression is undefined.",
    "formulas": "Difference of squares:\n$$a^2-b^2=(a-b)(a+b)$$\nDivide fractions (nonzero denominators):\n$$\\frac ab\\div\\frac cd=\\frac{ad}{bc}$$\nQuadratic discriminant:\n$$\\Delta=b^2-4ac$$",
    "example": "Simplify while keeping the restriction:\n$$\\frac{x^2-9}{x-3}=\\frac{(x-3)(x+3)}{x-3}=x+3$$\nValid only when \\(x\\ne3\\).",
    "tip": "Annotate excluded values before cancelling, and verify resulting values in the original problem.",
    "pitfall": "Assuming simplification removes restrictions on the original expression."
  },
  "m2-logs": {
    "summary": "Exponential and logarithmic functions are inverses. Their laws simplify products, quotients and powers, but logarithm arguments must be strictly positive (\\(x>0\\)).",
    "formulas": "For \\(a>0\\), \\(a\\ne1\\), and positive arguments:\n$$\\log_a(xy)=\\log_a x+\\log_a y$$\n$$\\log_a\\!\\left(\\frac{x}{y}\\right)=\\log_a x-\\log_a y$$\n$$\\log_a(x^n)=n\\log_a x$$\n$$\\ln(e^x)=x,\\qquad e^{\\ln x}=x\\;(x>0)$$",
    "example": "Solve \\(\\ln x=2\\):\n$$\\ln x=2\\Rightarrow x=e^2$$",
    "tip": "State the domain condition before solving any logarithmic equation and check the final answer.",
    "pitfall": "Using ln(x + y) = ln x + ln y, which is false."
  },
  "m2-trig": {
    "summary": "Further trigonometry extends identities and equation solving. Rearrange carefully, factor when possible and identify all angles satisfying both the identity and the interval.",
    "formulas": "$$\\sin 2x=2\\sin x\\cos x$$\n$$\\cos 2x=\\cos^2 x-\\sin^2 x$$\n$$\\cos 2x=1-2\\sin^2 x$$\n$$1+\\tan^2 x=\\sec^2 x$$",
    "example": "Solve \\(\\cos2x=0\\) for \\(0^\\circ\\le x<180^\\circ\\).\n$$2x=90^\\circ\\text{ or }270^\\circ$$\n$$x=45^\\circ\\text{ or }135^\\circ$$",
    "tip": "When multiplying an angle by 2, double the interval as well, and transform the solutions back at the end.",
    "pitfall": "Dividing an equation by sin x or cos x without separately checking when that factor equals zero."
  },
  "m2-diff": {
    "summary": "Further differentiation combines chain, product and quotient rules with logarithmic and exponential functions. It supports more sophisticated tangents, stationary points and related rates of change.",
    "formulas": "Chain rule:\n$$\\frac{\\mathrm d}{\\mathrm dx}f(g(x))=f'(g(x))g'(x)$$\nProduct rule:\n$$(uv)'=u'v+uv'$$\nQuotient rule (\\(v\\ne0\\)):\n$$\\left(\\frac uv\\right)'=\\frac{vu'-uv'}{v^2}$$\n$$\\frac{\\mathrm d}{\\mathrm dx}e^x=e^x,\\quad\\frac{\\mathrm d}{\\mathrm dx}\\ln x=\\frac1x\\;(x>0)$$",
    "example": "Differentiate \\(y=(3x+1)^4\\):\n$$\\frac{\\mathrm dy}{\\mathrm dx}=4(3x+1)^3\\cdot3=12(3x+1)^3$$",
    "tip": "Write the inner function and its derivative before applying the chain rule.",
    "pitfall": "Forgetting the derivative of the inner expression, or swapping terms in the quotient rule."
  },
  "m2-integration": {
    "summary": "Further integration includes standard exponential, logarithmic and trigonometric integrals, often after a substitution. Use definite integration for areas and, where specified, solids of revolution.",
    "formulas": "For \\(a\\ne0\\):\n$$\\int e^{ax}\\,\\mathrm dx=\\frac{e^{ax}}a+C$$\n$$\\int\\frac1x\\,\\mathrm dx=\\ln|x|+C$$\n$$\\int\\cos(ax)\\,\\mathrm dx=\\frac{\\sin(ax)}a+C$$\nAbout the x-axis:\n$$V=\\pi\\int_a^b[y(x)]^2\\,\\mathrm dx$$",
    "example": "Evaluate:\n$$\\int 2\\cos(2x)\\,\\mathrm dx=\\sin(2x)+C$$",
    "tip": "Label the axis of rotation and check the correct limits, units and squared radius for a volume problem.",
    "pitfall": "Forgetting the factor 1/a when integrating a function of ax."
  },
  "m2-numerical": {
    "summary": "Numerical methods estimate roots when exact algebraic solutions are difficult. Iteration produces successive approximations; Newton–Raphson uses the tangent to improve an estimate. Confirm that estimates meet the required accuracy.",
    "formulas": "Fixed-point iteration:\n$$x_{n+1}=g(x_n)$$\nNewton–Raphson method:\n$$x_{n+1}=x_n-\\frac{f(x_n)}{f'(x_n)}$$",
    "example": "For \\(f(x)=x^2-2\\), start with \\(x_0=1.5\\):\n$$x_1=1.5-\\frac{1.5^2-2}{2(1.5)}\\approx1.41667$$",
    "tip": "Show each iteration with sufficient working precision and round only at the final requested step.",
    "pitfall": "Using a starting estimate where f′(x) = 0, or rounding intermediate values too early."
  }
};
