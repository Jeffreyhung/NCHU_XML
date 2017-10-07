package XML;

public class PriceProxy implements XML.Price {
  private String _endpoint = null;
  private XML.Price price = null;
  
  public PriceProxy() {
    _initPriceProxy();
  }
  
  public PriceProxy(String endpoint) {
    _endpoint = endpoint;
    _initPriceProxy();
  }
  
  private void _initPriceProxy() {
    try {
      price = (new XML.PriceServiceLocator()).getPrice();
      if (price != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)price)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)price)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (price != null)
      ((javax.xml.rpc.Stub)price)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public XML.Price getPrice() {
    if (price == null)
      _initPriceProxy();
    return price;
  }
  
  public int getPrice(java.lang.String mixer, java.lang.String console, int speaker, int mic, int par, int led, int wire, int line) throws java.rmi.RemoteException{
    if (price == null)
      _initPriceProxy();
    return price.getPrice(mixer, console, speaker, mic, par, led, wire, line);
  }
  
  
}