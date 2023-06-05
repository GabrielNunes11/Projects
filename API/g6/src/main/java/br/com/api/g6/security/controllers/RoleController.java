package br.com.api.g6.security.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.api.g6.security.domain.Role;
import br.com.api.g6.security.services.RoleService;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/roles")
public class RoleController {
	@Autowired
	RoleService roleService;
	
	@PostMapping
	@SecurityRequirement(name="Bearer Auth")
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<Role> save(@RequestBody Role role) {
		Role newRole = roleService.save(role);
		if(newRole != null)
			return new ResponseEntity<>(newRole, HttpStatus.CREATED);
		else
			return new ResponseEntity<>(newRole, HttpStatus.BAD_REQUEST);
	}

}