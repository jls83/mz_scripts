var docTemplate = "1dXfoJEs5ZU50B87E9o8sNkKuGPhomTdU488ynICImik";
var docName = "Consignment Contract";

function onFormSubmit(e) {
	var jls_address = 'jsanders@themusiczoo.com';

	// Customer info
	var custName = e.values[1];
	var custStreet = e.values[2];
	var custCity = e.values[3];
	var custState = e.values[4];
	var custZip = e.values[5];
	var custPhone = e.values[8];
	var custEmail = e.values[7];

	// Instrument info
	var instMake = e.values[9];
	var instModel = e.values[10];
	var instSerial = e.values[11];

	// Sell Price info
	var consignInitSP = e.values[23];
	var consignPct = e.values[18];
	var consignBLSP = e.values[19];

	// Signature info
	var signName = e.values[20];
	var signDate = e.values[21];

	var sales_emails = {
	"Garrett Hess": "ghess@themusiczoo.com",
	"Jessica Koves": "jessica@themusiczoo.com",
	"Mark Di Donna": "mark@themusiczoo.com",
	"Nick Post": "npost@themusiczoo.com",
	"Rose Reina": "rreina@themusiczoo.com",
	"Tim Reynolds": "tim@themusiczoo.com",
	"Tommy Colletti": "tcolletti@themusiczoo.com",
	"Other": "sales@themusiczoo.com",
	};

	var sales_person = e.values[22];

	// Create PDF from template, give it file name
	var copyId = DriveApp.getFileById(docTemplate)
	.makeCopy(docName+' for '+custName + ' ' + instSerial)
	.getId();

	var copyDoc = DocumentApp.openById(copyId);  
	var copyBody = copyDoc.getActiveSection();

	// Customer info
	copyBody.replaceText('keyName', custName);

	var concatAddress = custStreet + ' ' + custCity + ', ' + custState + ' ' + custZip;
	copyBody.replaceText('keyConcatAddress', concatAddress);

	copyBody.replaceText('keyPhone', custPhone);

	// Instrument info
	copyBody.replaceText('keyMake', instMake);
	copyBody.replaceText('keyModel', instModel);
	copyBody.replaceText('keySerial', instSerial);

	// Sell Price info
	copyBody.replaceText('keyConsignPct', consignPct);
	copyBody.replaceText('keyBLSP', consignBLSP);
	copyBody.replaceText('keyInitSP', consignInitSP);

	// Signature info
	copyBody.replaceText('keyEsig', signName);
	copyBody.replaceText('keyDate', signDate);

	copyDoc.saveAndClose();

	var pdf = DriveApp.getFileById(copyId).getAs("application/pdf");

	var subject = "Your Guitar Consignment Contract from The Music Zoo";
	var body = "<p>Thank you for submitting your guitar for consignment! Attached is a copy of your consignment contract in PDF format.</p><p>If you have any questions, please feel free to call us at (516) 626-9292, or simply reply to this email to contact your Music Zoo Salesperson.</p><br><p>The Music Zoo</p>"
	// var email_address = jls_address + "," + sales_emails[ sales_person ] + "," + custEmail;

	// Sets "Sent By" field to TMZ if sales_person is Other

	if (sales_person == 'Other') {
		var sp_send = "The Music Zoo";
	}
	else {
		var sp_send = sales_person;
	}

	// sends email based on variables above

	MailApp.sendEmail({
		to: custEmail, 
		subject: subject,
		htmlBody: body,
		attachments: pdf,
		replyTo: sales_emails[ sales_person ],
		bcc: jls_address,
		cc: sales_emails[ sales_person ],
		name: sp_send,
	});

	DriveApp.getFileById(copyId).setTrashed(true);
  
};