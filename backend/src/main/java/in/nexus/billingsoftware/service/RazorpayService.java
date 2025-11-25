package in.nexus.billingsoftware.service;

import com.razorpay.RazorpayException;
import in.nexus.billingsoftware.io.RazorpayOrderResponse;

public interface RazorpayService {

    RazorpayOrderResponse createOrder(Double amount, String currency) throws RazorpayException;
}
