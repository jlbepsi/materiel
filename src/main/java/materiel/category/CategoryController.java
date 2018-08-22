package materiel.category;

import materiel.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/api") // This means URL's start with /api (after Application path)
public class CategoryController {
    @Autowired // This means to get the bean called categoryRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private CategoryRepository categoryRepository;


    // Get all Categorys
    @GetMapping(path="/categories")
    public @ResponseBody Iterable<Category> getAllCategorys() {
        // This returns a JSON or XML with the categorys
        return categoryRepository.findAll();
    }

    // Get a single Category
    @GetMapping("/categories/{id}")
    public @ResponseBody Category getCategoryById(@PathVariable(value = "id") Integer categoryId) {
        Optional<Category> category = categoryRepository.findById(categoryId);
        if (category == null || category.get() == null)
            throw new ResourceNotFoundException("Category", "id", categoryId);

        return category.get();
    }

    // Add a new Category
    @PostMapping(path="/categories") // Map ONLY POST Requests
    public @ResponseBody Category addNewCategory (@Valid @RequestBody Category category) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        return categoryRepository.save(category);
    }

    // Update a Category
    @PutMapping("/categories/{id}")
    public @ResponseBody Category updateCategory(@PathVariable(value = "id") Integer categoryId,
                                         @Valid @RequestBody Category categoryDetails) {

        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", categoryId));

        category.setLibelle(categoryDetails.getLibelle());
        category.setQuantitymax(categoryDetails.getQuantitymax());

        return categoryRepository.save(category);
    }

    // Delete a Category
    @DeleteMapping(path = "/categories/{id}")
    public @ResponseBody
    ResponseEntity<?> deleteCategory(@PathVariable(value = "id") Integer categoryId)
    {
        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new ResourceNotFoundException("Category", "id", categoryId));

        categoryRepository.delete(category);
        return  ResponseEntity.ok().build();
    }
}