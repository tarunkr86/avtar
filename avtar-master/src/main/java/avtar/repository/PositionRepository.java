package avtar.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import avtar.model.Position;

public interface PositionRepository extends PagingAndSortingRepository<Position, Integer> {
    Page<Position> findByNameLike(Pageable pageable, String name);
}