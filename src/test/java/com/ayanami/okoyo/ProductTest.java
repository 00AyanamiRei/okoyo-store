package com.ayanami.okoyo;

import com.ayanami.okoyo.entity.Category;
import com.ayanami.okoyo.entity.Product;
import com.ayanami.okoyo.entity.Vendor;
import com.ayanami.okoyo.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
//@Rollback(value = false)
public class ProductTest {
    @Autowired
    private ProductRepository productRepo;

    @Autowired
    private TestEntityManager entityManager;

    @Test
    void testCreateProduct() {
        Category category = entityManager.find(Category.class, 1);
        Vendor vendor = entityManager.find(Vendor.class, 1);

        Product product = new Product();
        product.setTitle("new_product");
        product.setAlias("new_product");
        product.setDescription("new_product");
        product.setPrice(36000);
        product.setImageURL("https://plugins.shopware-staging.overdose.digital/thumbnail/d3/e3/a5/1690970711/test%20%281%29_1920x1920.png");
        product.setCategory(category);
        product.setVendor(vendor);

        Product saveProduct = productRepo.save(product);
        assertThat(saveProduct).isNotNull();
        assertThat(saveProduct.getId()).isPositive();
    }

    @Test
    void testListAllProducts() {
        Iterable<Product> iterableProd = productRepo.findAll();
        iterableProd.forEach(System.out::println);
    }

    @Test
    void testGetProduct() {
        Integer id = 2;
        Product findById = productRepo.getReferenceById(id);
        System.out.println(findById);
        assertThat(findById).isNotNull();
    }

    @Test
    void testUpdateProduct() {
        Integer id = 12;
        Product product = productRepo.getReferenceById(id);

        product.setPrice(39000);
        productRepo.save(product);
        Product updatedProduct = entityManager.find(Product.class, id);

        assertThat(updatedProduct.getPrice()).isEqualTo(39000);
    }

    @Test
    void testDeleteProduct() {
        Integer id = 12;
        productRepo.deleteById(id);
        Optional<Product> result = productRepo.findById(id);

        assertThat(result.isEmpty());
    }

    @Test
    public void testSearchProduct(){
        String keyword = "new_product";
        int pageNum =  0;
        int pageSize = 4;
        Pageable pageable = PageRequest.of(pageNum, pageSize);
        Page<Product> page = productRepo.findAll(keyword, pageable);

        List<Product> productList = page.getContent();

        productList.forEach(product -> System.out.println(product));

        assertThat(productList.size()).isGreaterThan(0);
    }
}
