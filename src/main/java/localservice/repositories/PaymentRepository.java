package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.Payment;

public interface PaymentRepository extends CrudRepository<Payment, Integer>{

}
