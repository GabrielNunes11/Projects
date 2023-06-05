package br.com.api.g6.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.api.g6.services.FotoService;
import jakarta.validation.Valid;

@Valid
@RestController
@RequestMapping("/fotos")
public class FotoController {
	
	@Autowired
	FotoService fotoService;

}
