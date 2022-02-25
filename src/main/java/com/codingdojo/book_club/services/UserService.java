package com.codingdojo.book_club.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.book_club.models.LoginUser;
import com.codingdojo.book_club.models.User;
import com.codingdojo.book_club.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public User save(User user, BindingResult result) {
		if (!user.getPassword().equals(user.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Password Confirmation must match the Password.");
		}

		Optional<User> emailCheck = this.userRepository.findByEmail(user.getEmail());
		if (emailCheck.isPresent()) {
			result.rejectValue("email", "Unique", "User with email already exists.");
		}

		if (result.hasErrors()) {
			return null;
		} else {
			user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
			return this.userRepository.save(user);
		}
	}

	public User login(LoginUser loginUser, BindingResult result) {
		Optional<User> optUser = this.userRepository.findByEmail(loginUser.getEmail());

		if (optUser.isEmpty()) {
			result.rejectValue("email", "NotFound", "Credentials Invalid");
			return null;
		}

		User user = optUser.get();
		if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "InvalidPassword", "Credentials Invalid");
			return null;
		}

		return user;
	}

	public User findById(Long id) {
		Optional<User> optUser = this.userRepository.findById(id);
		if (optUser.isEmpty()) {
			return null;
		}
		return optUser.get();
	}
}
