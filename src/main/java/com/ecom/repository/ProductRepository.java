package com.ecom.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.ecom.model.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findByIsActiveTrue();

	Page<Product> findByIsActiveTrue(Pageable pageable);

	List<Product> findByShop(String shop);

	List<Product> findByTitleContainingIgnoreCaseOrShopContainingIgnoreCase(String ch, String ch2);

	Page<Product> findByShop(Pageable pageable, String shop);

	Page<Product> findByTitleContainingIgnoreCaseOrShopContainingIgnoreCase(String ch, String ch2,
			Pageable pageable);

	Page<Product> findByisActiveTrueAndTitleContainingIgnoreCaseOrShopContainingIgnoreCase(String ch, String ch2,
			Pageable pageable);
}
