package com.ayanami.okoyo;

import com.ayanami.okoyo.entity.Category;
import com.ayanami.okoyo.repository.CategoryRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import java.util.List;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
public class CategoryRepoTest {

//    @Autowired
//    private CategoryRepository categoryRep;
//
//    @BeforeEach
//    @Rollback(false) // Prevent rollback to retain test data
//    void setup() {
//        Category category = new Category();
//        category.setAlias("protectors");
//        category.setTitle("Protectors");
//        category.setEnabled(true);
//        categoryRep.save(category);
//    }
//
//    @Test
//    void testListEnabledCategories() {
//        List<Category> categories = categoryRep.findAllEnabled();
//
//        categories.forEach(category -> {
//            System.out.println(category.getTitle() + " (" + category.getEnabled() + ")");
//        });
//    }
//
//    @Test
//    void categoryFindByAlias() {
//        String alias = "protectors";
//
//        Category category = categoryRep.findByAliasEnabled(alias);
//
//        assertThat(category).isNotNull();
//    }
//
//    @Test
//    void testListRootCategories(){
//        List<Category> categories = categoryRep.findRootCategories();
//        categories.forEach(category -> System.out.println(category.getTitle()));
//    }
//}
}