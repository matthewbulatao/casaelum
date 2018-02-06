package localservice.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.Payment;
import localservice.repositories.PaymentRepository;

@Service
@Transactional
public class PaymentService extends BaseService<Payment>{

	private PaymentRepository paymentRepository;

	public PaymentService(PaymentRepository paymentRepository) {
		super(paymentRepository);
		this.paymentRepository = paymentRepository;
	}
	
	
}
