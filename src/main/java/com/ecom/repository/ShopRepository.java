package com.ecom.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ecom.model.Shop;

public interface ShopRepository extends JpaRepository<Shop, Integer> {

	public Boolean existsByName(String name);

	public List<Shop> findByIsActiveTrue();

}
