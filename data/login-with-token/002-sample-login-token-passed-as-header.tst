# Get A session token from one REST call and pass it as part of custom header in the next test case.
# Login and get a session token
{  "id" : "018-login",   
   "verb" : "GET", 
   "uri" : "https://abcdex1.{ENV}.org/login?user={userid}&pass={passwd}",
   "expected" : 200, 
   "keepBodyAs" : "sessionToken",
   "keepBodyDefault" : "D1A2C8F10A0AB0C0A1DEFAULT"
}
#END
#WAIT

# See: https://golang.org/pkg/regexp/syntax/
#   For RE Expression matching syntax 
#
# Test simple index page contains expected content.
{  "id" : "0182772-airSolarWater-dem-index-contains-solomon",   
   "verb" : "GET", 
   "uri" : "https://airsolarwater.com/dem/", 
   "headers": {
      "sessionToken": "{sessionToken}",
      "Meta-Roles": "PUBLIC",
      "ENV" : "{ENVIRONMENT}"
   },
   "expected" : 200, 
   "rematch" : ".*Solomon.*Tuvalu.*Tesla", 
   "message" :"Air solar Water index must contain island names"
}
#END