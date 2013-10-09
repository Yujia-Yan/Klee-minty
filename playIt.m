% This script solves the 3,4,5,6 Klee-Minty problems to verify
% exponential growth in the number of iterations
% AUTHOR: Yujia Yan

toSolve= [15,19,18,17,15,14, 12,11, 10, 9,8, 19,24, 32,6, 4, 19 ,26];
iters=[64,64,64,32, 16,16,16,16, 16, 16, 16,16,16,16,16, 16, 16,16,32,64];
pitchShift=[0,0,-1,-1, 0, 4, 2, 1, 0, 2, 4,6,8, 10,12, 64, 32, 24, 12, 0];

for i= 1:length(toSolve)
	fprintf(' Now solving for the Klee-Minty Problem: %.0f \n', toSolve(i))

	[A, b, c]= KleeMinty(toSolve(i));
	BASIS= toSolve(i)+1:2*toSolve(i);
	step=0;
	%%script provided in the lecture resource
	% The Simplex Algorithm
	% INPUT c, A, b, BASIS / c is a row vector
	% pie = marginal cost
	% d = reduced cost
	% jE = entering variable index
	% jL = leaving variable index
	% bbar = current basic solution
	% 
	INVB = inv(A(:,BASIS)); %(inverse of basis)
	bbar = INVB*b; %(the current basic solutions)
	degen = 0; %(This variable counts degenerate pivots.)
	for step =1:iters(i) %(Limit iterations to 10000.)
		toSolve(i)
		cB = c(BASIS); %Cost function associated with the basis

		pie = cB*INVB; %BTRAN: Calculate marginal cost 
		d = c-pie*A; %PRICING: Calculate reduced cost 
		[dmin,jE] = min(d); %(Find the entering variable.)
		if dmin >=-1e-10, break, end %(Stop if all reduced costs >=0.)
			y = INVB*A(:,jE); %(FTRAN: update incoming column)
			INDEX = find(y>1e-6); %(Find positive components of y.)
			if isempty(INDEX) %(if y<=0 stop, LP is unbounded)
				error('problem is unbounded')
			end

		RATIO = bbar(INDEX)./y(INDEX); %RATIO test
		[theta,t] = min(RATIO);
		if theta < 1e-10 %(If theta = 0, the pivot is degenerate.) 

			degen = degen + 1;
		end
		jL = INDEX(t); %(index of smallest ratio)
		BASIS(jL) = jE; %(UPDATE: Replace col jL with col jE.)
		INVB = inv(A(:,BASIS)); %(inverse of the basis)
		bbar = INVB*b;
		
		playSin(0.1,freqMapping(jE+pitchShift(i)), length(d)/32, 44100, jE*0.0001/(length(d)+0.01), 1/(length(d)+0.01));
		pause(length(d)/64/2)
	end
		n = length(c);
		x= zeros(n,1);
		x(BASIS) = bbar;% Return Solution
end
