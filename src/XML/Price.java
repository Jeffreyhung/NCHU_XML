/**
 * Price.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package XML;

public interface Price extends java.rmi.Remote {
    public int getPrice(java.lang.String mixer, java.lang.String console, int speaker, int mic, int par, int led, int wire, int line) throws java.rmi.RemoteException;
}
