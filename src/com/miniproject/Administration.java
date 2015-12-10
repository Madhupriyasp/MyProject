package com.miniproject;

public class Administration {
	
	Administration() {}

		private String name;
		private String email;
		private String username;
		private String password1;
		private String password2;
		private String birthdate;
		private String gender;
		private String role;
	

		public void setName(String newName) {
			name = newName;
		}

		public String getName() {
			return name;
		}

		public void setEmail(String newemail) {
			email = newemail;
		}

		public String getEmail() {
			return email;
		}

		public void setUserName(String newUserName) {
			username = newUserName;
		}

		public String getUserName() {
			return username;

		}
		public void setPassword(String newPassword) {
			password1 = newPassword;
		}

		public String getPassword() {
			return password1;

		}
		public void setRePassword(String newRePassword) {
			password2 = newRePassword;
		}

		public String getRePassword() {
			return password2;

		}
		public void setBirthDate(String newBirthDate) {
			birthdate = newBirthDate;
		}

		public String getBirthDate() {
			return birthdate;
		}

		public void setGender(String newGender) {
			gender = newGender;
		}

		public String getGender() {
			return gender;

		}

		public void setRole(String newRole) {
			role = newRole;
		}

		public String getRole() {
			return role;
		}

		
	

}
