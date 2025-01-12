package com.ecom.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.ecom.model.Shop;

public interface ShopService {

	public Shop saveShop(Shop shop);

	public Boolean existShop(String name);

	public List<Shop> getAllShop();

	public Boolean deleteShop(int id);

	public Shop getShopById(int id);

	public List<Shop> getAllActiveShop();

	public Page<Shop> getAllShopPagination(Integer pageNo,Integer pageSize);

}
