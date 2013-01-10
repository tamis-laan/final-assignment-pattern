%RGB2HSV Dataset overload
%
%  B = RGB2HSV(A)

% Copyright: R.P.W. Duin, r.p.w.duin@prtools.org
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function b = rgb2hsv(a)
	
	prtrace(mfilename,2);
	
  if isdataset(a)
    isdataim(a);
    im = data2im(a);
    imsize = getfeatsize(a);
    out = feval(mfilename,im);
    if isobjim(a)
      b = im2obj(out,imsize);
      b = setdat(a,getdata(b));
      b = setfeatsize(b,imsize);
    else
      b = im2feat(out);
      b = setdat(a,b);
    end
	elseif isdatafile(a)
    isdataim(a);
    b = filtm(a,mfilename);
    imsize = getfeatsize(a); 
    if isobjim(a)
      imsize = getfeatsize(a); 
      b = setfeatsize(b,imsize);
    else
      imsize = getobjsize(a); 
      b = setobjsize(b,imsize);
    end
  else
    error('Illegal datatype for input')
  end
return
