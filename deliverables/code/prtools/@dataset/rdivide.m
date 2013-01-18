%RDIVIDE Right dataset divide. Dataset overload

% $Id: rdivide.m,v 1.2 2006/03/08 22:06:58 duin Exp $

function c = rdivide(a,b)
	prtrace(mfilename,2);
		
	sa = size(a);
	sb = size(b);

	% Check whether the sizes are the same.
 
	if (any(sa ~= 1) & any(sb ~= 1) & any(sa ~= sb))
		error('datasets should have equal size')
	end

	if isa(a,'dataset') & ~isa(b,'dataset')
		c = a;
		d = a.data ./ b;
	elseif ~isa(a,'dataset') & isa(b,'dataset')
		c = b;
		d = a ./ b.data;
	else
		c = a;
		d = a.data ./ b.data;
	end
	c = setdata(c,d);
	
return
