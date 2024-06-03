package com.ayanami.okoyo.service;

import com.ayanami.okoyo.entity.Product;
import com.ayanami.okoyo.entity.Category;
import com.ayanami.okoyo.exception.ProductNotFoundException;
import com.ayanami.okoyo.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductService implements IProductService {
    @Autowired
    private ProductRepository productRepository;
    public static final int PRODUCTS_PER_PAGE = 10;
    public static final int SEARCH_RESULTS_PAGE = 10;

    public static final int PRODUCTS_PER_ADMIN_PAGE = 5;

    @Autowired
    private CategoryService categoryService;


    @Override
    public Page<Product> listByCategory(int pageNum, Integer categoryId) {
        String categoryIdMatch = "-" + String.valueOf(categoryId) + "-";
        Pageable pageable = PageRequest.of(pageNum - 1, PRODUCTS_PER_PAGE);

        return productRepository.listByCategory(categoryId, pageable, categoryIdMatch);
    }

    @Override
    public Page<Product> listByPage(int pageNum, String sortField, String sortDir, String keyword,
                                    Integer categoryId) {
        Sort sort = Sort.by(sortField);
        sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();

        Pageable pageable = PageRequest.of(pageNum - 1, PRODUCTS_PER_ADMIN_PAGE, sort);

        if (keyword != null && !keyword.isEmpty()) {
            if (categoryId != null && categoryId > 0) {
                String categoryIdMatch = "-" + String.valueOf(categoryId) + "-";
                return productRepository.searchInCategory(categoryId, categoryIdMatch, keyword, pageable);
            }
            return productRepository.findAll(keyword, pageable);
        }
        if (categoryId != null && categoryId > 0) {
            String categoryIdMatch = "-" + String.valueOf(categoryId) + "-";
            return productRepository.findAllInCategory(categoryId, categoryIdMatch, pageable);
        }

        return productRepository.findAll(pageable);
    }

    @Override
    public List<Product> getAllProducts() throws ProductNotFoundException {
        List<Product> listProducts = productRepository.findAll();
        if (listProducts.isEmpty()) {
            throw new ProductNotFoundException("Couldn't find any product in DB");
        }
        return listProducts;
    }

    @Override
    public List<Product> getRandomAmountOfProducts() throws ProductNotFoundException {
        List<Category> allCategories = categoryService.listCategoriesUserInForm();
        Collections.shuffle(allCategories);

        List<Product> productList = new ArrayList<>();
        for (Category category : allCategories) {
            List<Product> productsInCategory = productRepository.findAllByCategoryId(category.getId());
            if (!productsInCategory.isEmpty()) {
                Collections.shuffle(productsInCategory);
                productList.add(productsInCategory.get(0));
                if (productList.size() == 8) {
                    break;
                }
            }
        }

        if (productList.isEmpty()) {
            throw new ProductNotFoundException("Couldn't find any product in DB");
        }

        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        if (product.getAlias() == null || product.getAlias().isEmpty()) {
            String defaultAlias = product.getTitle().toLowerCase();
            product.setAlias((new CategoryService().convertCyrillic(defaultAlias).replaceAll(" ", "_")));
        } else {
            product.setAlias(product.getAlias().replaceAll(" ", "_").toLowerCase());
        }
        productRepository.save(product);
    }

    @Override
    public Product getProduct(Integer id) throws ProductNotFoundException {
        try {
            return productRepository.getReferenceById(id);
        } catch (NoSuchElementException e) {
            throw new ProductNotFoundException("Couldn't find any product with id " + id);
        }
    }

    @Override
    public Product getProduct(String alias) throws ProductNotFoundException {
        try {
            return productRepository.findByAlias(alias);
        } catch (NoSuchElementException e) {
            throw new ProductNotFoundException("Couldn't find any product with alias " + alias);
        }
    }

    @Override
    public void deleteProduct(Integer id) throws ProductNotFoundException {
        Long countById = productRepository.countById(id);
        if (countById == null || countById == 0) {
            throw new ProductNotFoundException("Couldn't find any product with ID " + id);
        }
        productRepository.deleteById(id);
    }

    @Override
    public String checkUnique(Integer id, String title) {
        boolean isCreatingNew = (id == null || id == 0);
        Product productByName = productRepository.findByTitle(title);
        if (isCreatingNew) {
            if (productByName != null) return "Duplicate";
        } else {
            if (productByName != null && !Objects.equals(productByName.getId(), id)) {
                return "Duplicate";
            }
        }
        return "OK";
    }

    public Page<Product> search(String keyword, int pageNum) {
        Pageable pageable = PageRequest.of(pageNum - 1, SEARCH_RESULTS_PAGE);
        return productRepository.search(keyword, pageable);
    }
}
