tail -f ~/Logging/Philips.log | awk 	'/Javascript Alert/ {print "\033[41m" $0 "\033[49m"}
					 /[HTVLIB]/         {print "\033[32m" $0 "\033[39m"} 
					 /WIXP TV --> JS:/  {print "\033[31m" $0 "\033[39m"}'

#					 /[HCAPI]/          {print "\033[36m" $0 "\033[39m"}'

				
