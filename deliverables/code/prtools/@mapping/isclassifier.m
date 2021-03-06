%ISCLASSIFIER Test on normed classifier
%
%    I = ISCLASSIFIER(W)
%    ISCLASSIFIER(W)
%
% A mapping W is a classifier if its OUT_CONV field is larger 
% than zero. In that case confidences will be returned.If called
% without an output argument ISCLASSIFIER generates an error
% if W is not a classifier.

% $Id: isclassifier.m,v 1.2 2006/03/08 22:06:58 duin Exp $

function i = isclassifier(w)
		prtrace(mfilename,2);
	i = (w.out_conv > 0);

	if (nargout == 0) & (i == 0)
		error([newline '---- Classifier expected ----']);
	end
return
