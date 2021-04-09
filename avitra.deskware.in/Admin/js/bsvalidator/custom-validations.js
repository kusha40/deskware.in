$(document).ready(function(){$("#defaultForm").bootstrapValidator({message:"This value is not valid",feedbackIcons:{valid:"fa fa-check",invalid:"fa fa-times",validating:"fa fa-refresh"},fields:{username:{message:"The username is not valid",validators:{notEmpty:{message:"The username is required and can't be empty"},stringLength:{min:6,max:30,message:"The username must be more than 6 and less than 30 characters long"},regexp:{regexp:/^[a-zA-Z0-9_\.]+$/,message:"The username can only consist of alphabetical, number, dot and underscore"}}},country:{validators:{notEmpty:{message:"The country is required and can't be empty"}}},acceptTerms:{validators:{notEmpty:{message:"You have to accept the terms and policies"}}},email:{validators:{notEmpty:{message:"The email address is required and can't be empty"},emailAddress:{message:"The input is not a valid email address"}}},website:{validators:{uri:{message:"The input is not a valid URL"}}},phoneNumberUS:{validators:{phone:{message:"The input is not a valid US phone number"}}},phoneNumberUK:{validators:{phone:{message:"The input is not a valid UK phone number",country:"GB"}}},color:{validators:{hexColor:{message:"The input is not a valid hex color"}}},zipCode:{validators:{zipCode:{country:"US",message:"The input is not a valid US zip code"}}},password:{validators:{notEmpty:{message:"The password is required and can't be empty"},identical:{field:"confirmPassword",essage:"The password and its confirm are not the same"}}},confirmPassword:{validators:{notEmpty:{message:"The confirm password is required and can't be empty"},identical:{field:"password",message:"The password and its confirm are not the same"}}},ages:{validators:{lessThan:{value:100,inclusive:!0,message:"The ages has to be less than 100"},greaterThan:{value:10,inclusive:!1,message:"The ages has to be greater than or equals to 10"}}}}})}),$(document).ready(function(){$("#paymentForm").bootstrapValidator({feedbackIcons:{valid:"fa fa-check",invalid:"fa fa-times",validating:"fa fa-refresh"},fields:{cardHolder:{selector:"#cardHolder",validators:{notEmpty:{message:"The card holder is required"},stringCase:{message:"The card holder must contain upper case characters only",case:"upper"}}},ccNumber:{selector:"#ccNumber",validators:{notEmpty:{message:"The credit card number is required"},creditCard:{message:"The credit card number is not valid"}}},expMonth:{selector:'[data-stripe="exp-month"]',validators:{notEmpty:{message:"The expiration month is required"},digits:{message:"The expiration month can contain digits only"},callback:{message:"Expired",callback:function(a,b){a=parseInt(a,10);var c=b.getFieldElements("expYear").val(),d=(new Date).getMonth()+1,e=(new Date).getFullYear();return!(a<0||a>12)&&(""==c||(c=parseInt(c,10),(c>e||c==e&&a>d)&&(b.updateStatus("expYear","VALID"),!0)))}}}},expYear:{selector:'[data-stripe="exp-year"]',validators:{notEmpty:{message:"The expiration year is required"},digits:{message:"The expiration year can contain digits only"},callback:{message:"Expired",callback:function(a,b){a=parseInt(a,10);var c=b.getFieldElements("expMonth").val(),d=(new Date).getMonth()+1,e=(new Date).getFullYear();return!(a<e||a>e+10)&&(""!=c&&(c=parseInt(c,10),(a>e||a==e&&c>d)&&(b.updateStatus("expMonth","VALID"),!0)))}}}},cvvNumber:{selector:".cvvNumber",validators:{notEmpty:{message:"The CVV number is required"},cvv:{message:"The value is not a valid CVV",creditCardField:"ccNumber"}}}}})}),$(document).ready(function(){$("#movieForm").bootstrapValidator({feedbackIcons:{valid:"fa fa-check",invalid:"fa fa-times",validating:"fa fa-reload"},fields:{title:{group:".col-md-8",validators:{notEmpty:{message:"The title is required"},stringLength:{max:200,message:"The title must be less than 200 characters long"}}},genre:{group:".col-md-4",validators:{notEmpty:{message:"The genre is required"}}},director:{group:".col-md-4",validators:{notEmpty:{message:"The director name is required"},stringLength:{max:80,message:"The director name must be less than 80 characters long"}}},writer:{group:".col-md-4",validators:{notEmpty:{message:"The writer name is required"},stringLength:{max:80,message:"The writer name must be less than 80 characters long"}}},producer:{group:".col-md-4",validators:{notEmpty:{message:"The producer name is required"},stringLength:{max:80,message:"The producer name must be less than 80 characters long"}}},website:{group:".col-md-6",validators:{notEmpty:{message:"The website address is required"},uri:{message:"The website address is not valid"}}},trailer:{group:".col-md-6",validators:{notEmpty:{message:"The trailer link is required"},uri:{message:"The trailer link is not valid"}}},review:{validators:{stringLength:{max:500,message:"The review must be less than 500 characters long"}}},rating:{validators:{notEmpty:{message:"The rating is required"}}}}})});