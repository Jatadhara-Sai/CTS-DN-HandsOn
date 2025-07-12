package com.example.jwt_auth.controller;

import com.example.jwt_auth.util.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.Collections;

@RestController
public class AuthenticationController {

    @Autowired
    private JwtUtil jwtUtil;

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(@RequestHeader(value = "Authorization", required = false) String authHeader) {
        System.out.println("➡️ /authenticate called");

        if (authHeader == null || !authHeader.startsWith("Basic ")) {
            System.out.println("❌ No Authorization header or invalid format");
            return ResponseEntity.status(401).body("Authorization header missing or invalid");
        }

        String base64Credentials = authHeader.substring("Basic ".length()).trim();
        byte[] decodedBytes = Base64.getDecoder().decode(base64Credentials);
        String decodedCredentials = new String(decodedBytes, StandardCharsets.UTF_8);
        System.out.println("🔓 Decoded: " + decodedCredentials);

        String[] parts = decodedCredentials.split(":", 2);
        if (parts.length == 2) {
            String username = parts[0];
            String password = parts[1];

            if ("user".equals(username) && "pwd".equals(password)) {
                String token = jwtUtil.generateToken(username);
                System.out.println("✅ Token generated");
                return ResponseEntity.ok(Collections.singletonMap("token", token));
            }
        }

        return ResponseEntity.status(401).body("Invalid username or password");
    }
}
