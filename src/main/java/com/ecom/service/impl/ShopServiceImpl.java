package com.ecom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import com.ecom.model.Shop;
import com.ecom.repository.ShopRepository;
import com.ecom.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopRepository shopRepository;

	@Override
	public Shop saveShop(Shop shop) {
		return shopRepository.save(shop);
	}

	@Override
	public List<Shop> getAllShop() {
		return shopRepository.findAll();
	}

	@Override
	public Boolean existShop(String name) {
		return shopRepository.existsByName(name);
	}

	@Override
	public Boolean deleteShop(int id) {
		Shop shop = shopRepository.findById(id).orElse(null);

		if (!ObjectUtils.isEmpty(shop)) {
			shopRepository.delete(shop);
			return true;
		}
		return false;
	}

	@Override
	public Shop getShopById(int id) {
		Shop shop = shopRepository.findById(id).orElse(null);
		return shop;
	}

	@Override
	public List<Shop> getAllActiveShop() {
		List<Shop> shops = shopRepository.findByIsActiveTrue();
		return shops;
	}

	@Override
	public Page<Shop> getAllShopPagination(Integer pageNo, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
		return shopRepository.findAll(pageable);
	}

}
