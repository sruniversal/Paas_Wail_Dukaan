package com.ecom.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import com.ecom.model.Product;
import com.ecom.repository.ProductRepository;
import com.ecom.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public Product saveProduct(Product product) {
		return productRepository.save(product);
	}

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Page<Product> getAllProductsPagination(Integer pageNo, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
		return productRepository.findAll(pageable);
	}

	@Override
	public Boolean deleteProduct(Integer id) {
		Product product = productRepository.findById(id).orElse(null);

		if (!ObjectUtils.isEmpty(product)) {
			productRepository.delete(product);
			return true;
		}
		return false;
	}

	@Override
	public Product getProductById(Integer id) {
		Product product = productRepository.findById(id).orElse(null);
		return product;
	}

	@Override
	public Product updateProduct(Product product, MultipartFile image) {

		Product dbProduct = getProductById(product.getId());

		String imageName = image.isEmpty() ? dbProduct.getImage() : image.getOriginalFilename();

		dbProduct.setTitle(product.getTitle());
		dbProduct.setDescription(product.getDescription());
		dbProduct.setShop(product.getShop());
		dbProduct.setPrice(product.getPrice());
		dbProduct.setStock(product.getStock());
		dbProduct.setImage(imageName);
		dbProduct.setIsActive(product.getIsActive());
		dbProduct.setDiscount(product.getDiscount());

		// 5=100*(5/100); 100-5=95
		Double disocunt = product.getPrice() * (product.getDiscount() / 100.0);
		Double discountPrice = product.getPrice() - disocunt;
		dbProduct.setDiscountPrice(discountPrice);

		Product updateProduct = productRepository.save(dbProduct);

		if (!ObjectUtils.isEmpty(updateProduct)) {

			if (!image.isEmpty()) {

				try {
					File saveFile = new ClassPathResource("static/img").getFile();

					Path path = Paths.get(saveFile.getAbsolutePath() + File.separator + "product_img" + File.separator
							+ image.getOriginalFilename());
					Files.copy(image.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return product;
		}
		return null;
	}

	@Override
	public List<Product> getAllActiveProducts(String shop) {
		List<Product> products = null;
		if (ObjectUtils.isEmpty(shop)) {
			products = productRepository.findByIsActiveTrue();
		} else {
			products = productRepository.findByShop(shop);
		}

		return products;
	}

	@Override
	public List<Product> searchProduct(String ch) {
		return productRepository.findByTitleContainingIgnoreCaseOrShopContainingIgnoreCase(ch, ch);
	}

	@Override
	public Page<Product> searchProductPagination(Integer pageNo, Integer pageSize, String ch) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
		return productRepository.findByTitleContainingIgnoreCaseOrShopContainingIgnoreCase(ch, ch, pageable);
	}

	@Override
	public Page<Product> getAllActiveProductPagination(Integer pageNo, Integer pageSize, String shop) {

		Pageable pageable = PageRequest.of(pageNo, pageSize);
		Page<Product> pageProduct = null;

		if (ObjectUtils.isEmpty(shop)) {
			pageProduct = productRepository.findByIsActiveTrue(pageable);
		} else {
			pageProduct = productRepository.findByShop(pageable, shop);
		}
		return pageProduct;
	}

	@Override
	public Page<Product> searchActiveProductPagination(Integer pageNo, Integer pageSize, String shop, String ch) {

		Page<Product> pageProduct = null;
		Pageable pageable = PageRequest.of(pageNo, pageSize);

		pageProduct = productRepository.findByisActiveTrueAndTitleContainingIgnoreCaseOrShopContainingIgnoreCase(ch,
				ch, pageable);

//		if (ObjectUtils.isEmpty(shop)) {
//			pageProduct = productRepository.findByIsActiveTrue(pageable);
//		} else {
//			pageProduct = productRepository.findByShop(pageable, shop);
//		}
		return pageProduct;
	}

}
