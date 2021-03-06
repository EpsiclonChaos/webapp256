package morozov.services.business;


import morozov.entity.Product;
import morozov.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Component
public class ProductBusinessServiceImpl implements ProductBusinessService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private GroupBusinessServiceImpl groupBusinessService;

    @Transactional
    public void saveProduct(Product product) {
        if (product.getGroupId() != null)
            product.setGroup(groupBusinessService.findGroup(product.getGroupId()));
        productRepository.save(product);
    }

    public List<Product> findAllProducts() {
        return productRepository.findAll();
    }

    public void deleteProduct(Long id) {
        productRepository.delete(id);
    }

    public Product findProduct(Long id) {
        return productRepository.findOne(id);
    }

}