/**
 * PriceServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package XML;

public class PriceServiceLocator extends org.apache.axis.client.Service implements XML.PriceService {

    public PriceServiceLocator() {
    }


    public PriceServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PriceServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for Price
    private java.lang.String Price_address = "http://140.120.78.192:8090/Axis/services/Price";

    public java.lang.String getPriceAddress() {
        return Price_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String PriceWSDDServiceName = "Price";

    public java.lang.String getPriceWSDDServiceName() {
        return PriceWSDDServiceName;
    }

    public void setPriceWSDDServiceName(java.lang.String name) {
        PriceWSDDServiceName = name;
    }

    public XML.Price getPrice() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Price_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getPrice(endpoint);
    }

    public XML.Price getPrice(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            XML.PriceSoapBindingStub _stub = new XML.PriceSoapBindingStub(portAddress, this);
            _stub.setPortName(getPriceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setPriceEndpointAddress(java.lang.String address) {
        Price_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (XML.Price.class.isAssignableFrom(serviceEndpointInterface)) {
                XML.PriceSoapBindingStub _stub = new XML.PriceSoapBindingStub(new java.net.URL(Price_address), this);
                _stub.setPortName(getPriceWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("Price".equals(inputPortName)) {
            return getPrice();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://XML", "PriceService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://XML", "Price"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("Price".equals(portName)) {
            setPriceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
