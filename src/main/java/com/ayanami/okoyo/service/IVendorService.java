package com.ayanami.okoyo.service;

import com.ayanami.okoyo.entity.Vendor;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IVendorService {
    List<Vendor> getAllVendors();

    void saveVendor(Vendor vendor);

    Vendor getVendor(int id);

    void deleteVendor(int id);

    Page<Vendor> listByPage(int pageNum);

    String checkVendorTitle(Integer id, String title);
}
