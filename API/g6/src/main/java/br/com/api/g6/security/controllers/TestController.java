package br.com.api.g6.security.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/test")
//@SecurityRequirement(name = "Bearer Auth")
//@PreAuthorize("hasRole('ADMIN')")
public class TestController {
	@GetMapping("/all")
	public String allAccess() {
		return "Public Content.";
	}
	
	@SecurityRequirement(name = "Bearer Auth")
	@PreAuthorize("hasRole('ADMIN') or hasRole('USER')")
	@GetMapping("/user")
	public String userAccess() {
		return "User Content.";
	}

	@GetMapping("/mod")
	public String moderatorAccess() {
		return "Moderator Board.";
	}

	@SecurityRequirement(name = "Bearer Auth")
	@PreAuthorize("hasRole('ADMIN')")
	@GetMapping("/admin")
	public String adminAccess() {
		return "Admin Board.";
	}
}