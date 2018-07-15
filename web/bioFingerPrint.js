function regist()
{
    var a, res1, adh, type, bio;
    adh = document.getElementById("adhar").value;
    //alert('inside Bio');
var err, payload;
var result = false;
// Check ID is not NULL
if ( adh == "" )
{
alert('Please enter user id !');
return(false);
}
try // Exception handling
{
DEVICE_AUTO_DETECT = 255;
//alert('a');
var objBioBSP = new ActiveXObject('BioBSPCOMM.BioBSP');
//alert('b');
// Open device. [AUTO_DETECT]
// You must open device before enroll.
objBioBSP.Open(DEVICE_AUTO_DETECT);
err = objBioBSP.ErrorCode; // Get error code
if ( err != 0 ) // Device open failed
{
alert('Device open failed !');
}
else
{
// Enroll user's fingerprint.
objBioBSP.Enroll(payload);
err = objBioBSP.ErrorCode; // Get error code
if ( err != 0 ) // Enroll failed
{
alert('Registration failed ! Error Number : [' + err + ']');
}
else // Enroll success
{
// Get text encoded FIR data from NBioBSP module.
document.MainForm.FIRTextData.value = objBioBSP.TextEncodeFIR;
alert('Registration success !');
result = true;
}
// Close device. [AUTO_DETECT]
objBioBSP.Close(DEVICE_AUTO_DETECT);
}
objBioBSP = 0;
}
catch(e)
{
alert(e.message);
return(false);
}
if ( result )
{
// Submit main form
document.MainForm.submit();
}
return result;
}