/**
 * PriceService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package XML;

public interface PriceService extends javax.xml.rpc.Service {
    public java.lang.String getPriceAddress();

    public XML.Price getPrice() throws javax.xml.rpc.ServiceException;

    public XML.Price getPrice(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
