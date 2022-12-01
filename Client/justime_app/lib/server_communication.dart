import 'dart:convert';
import 'package:http/http.dart' as http;

sendData(requestType, username, password, [email])
{
	if(requestType == 'register'){
		registerUser(username, email, password);
	}
	else if (requestType == 'login'){
		loginUser(username, password);
	}
}

registerUser(username, email, password) async {
	var response = await http.post(Uri.parse('http://192.168.1.201/index.php/user/register'),
		headers: <String, String>{
			'Content-Type': 'application/json; charset=UTF-8',
		},
		body: jsonEncode(<String, String>{
			"username": username,
			"email": email,
			"password": password,
	}));
	print(response.body);

}

loginUser(identifier, password) async {
	var response = await http.post(Uri.parse('http://192.168.1.201/index.php/user/login'),
		headers: <String, String>{
			'Content-Type': 'application/json; charset=UTF-8',
		},
		body: jsonEncode(<String, String>{
			"identifier": identifier,
			"password": password,
	}));
	print(response.body);
}

