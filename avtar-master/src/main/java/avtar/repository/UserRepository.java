package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.User;

public interface UserRepository extends CrudRepository<User, Integer>,PagingAndSortingRepository<User, Integer> {
    User findByEmail(String email);
    Page<User> findByNameLike(Pageable pageable, String name);
}
