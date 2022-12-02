import 'dart:convert';
import 'package:http/http.dart' as http;


Map<String, String> headers = {};
String ip = '192.168.1.201';

sendData(requestType, username, password, [email])
{
	if(requestType == 'register'){
		registerUser(username, email, password);
	}
	else if (requestType == 'login'){
		loginUser(username, password);
	}
    else if (requestType == 'logout'){
        logout();    
    }
}

registerUser(username, email, password) async {
	http.Response response = await http.post(Uri.parse('http://$ip/index.php/user/register'),
		headers: <String, String>{
			'Content-Type': 'application/json; charset=UTF-8',
		},
		body: jsonEncode(<String, String>{
			"username": username,
			"email": email,
			"password": password,
	}));
	
    updateCookie(response);
	print(response.body);
}

loginUser(identifier, password) async {
	http.Response response = await http.post(Uri.parse('http://$ip/index.php/user/login'),
		headers: <String, String>{
			'Content-Type': 'application/json; charset=UTF-8',
		},
		body: jsonEncode(<String, String>{
			"identifier": identifier,
			"password": password,
	}));

    updateCookie(response);
	print(response.body);
}


logout() async {
    http.Response response = await http.post(Uri.parse('http://$ip/index.php/user/logout'),
            headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
            },
        );

    updateCookie(response);
	print(response.body);
}




Future<String> getUserInfo() async{
    http.Response response = await http.get(Uri.parse('http://$ip/index.php/user/info'), headers: headers);
    updateCookie(response);

    print(response.body);

    return response.body;
}



void updateCookie(http.Response response) {
String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
        int index = rawCookie.indexOf(';');

        headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
}