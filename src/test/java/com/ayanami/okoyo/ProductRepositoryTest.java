package com.ayanami.okoyo;


import com.ayanami.okoyo.entity.Product;
import com.ayanami.okoyo.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(value = false)
public class ProductRepositoryTest {
//    @Autowired
//    ProductRepository productRepository;
//
//    @Test
//    public void testFindByAlias() {
//        String alias = "ranobe";
//
//        Product product = productRepository.findByAlias(alias);
//
//        assertThat(product).isNotNull();
//    }
}
