function result=freqMapping(val)
 % this function will map the value to a frequency		
 result= 440* 2^((mod(val,24)/12)); 
end

