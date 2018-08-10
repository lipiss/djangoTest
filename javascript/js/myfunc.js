function jsonbutton1() 
{
    var s = '{"first_name" : "Sammy1", "last_name" : "Shark1", "location" : "Ocean1"}';
    var obj = JSON.parse(s);
    document.getElementById("user").innerHTML =
    "Name: " + obj.first_name + "<br>" + "Last Name: " + obj.last_name + "<br>" +
    "Location: " + obj.location;
}

var colorCodes = {

    back  : "#fff",
    front : "#888",
    side  : "#369"
  
  };