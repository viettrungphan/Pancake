//
//  Factory.swift
//  Pancake
//
//  Created by mxa on 20.07.2017.
//  Copyright © 2017 mxa. All rights reserved.
//

import Foundation
import CoreAudio.AudioServerPlugIn


// MARK: - Framework

var pancakeDriverInterface: AudioServerPlugInDriverInterface? = nil
var pancakeDriverInterfacePointer: UnsafeMutablePointer<AudioServerPlugInDriverInterface>? = nil
var pancakeDriverReference: AudioServerPlugInDriverRef? = nil

//var pancakeFactory = PancakeFactory()
//
//func Pancake_Create(allocator: CFAllocator!, requestedTypeUUID: CFUUID!) -> UnsafeMutableRawPointer? {
//    let driverRef = pancakeFactory.create(allocator: allocator, requestedTypeUUID: requestedTypeUUID)
//    return UnsafeMutableRawPointer(driverRef)
//}
//
//internal class PancakeFactory {
//
//    func create(allocator: CFAllocator?, requestedTypeUUID: CFUUID?) -> AudioServerPlugInDriverRef? {
//        guard CFEqual(requestedTypeUUID, kUUID.audioServerPlugInTypeUUID) else {
//            assertionFailure()
//            return nil
//        }
//
//        pancakeDriverInterface = AudioServerPlugInDriverInterface(
//            _reserved: nil,
//            QueryInterface: Pancake_queryInterface,
//            AddRef: Pancake_addRef,
//            Release: Pancake_release,
//            Initialize: Pancake_initialize,
//            CreateDevice: Pancake_createDevice,
//            DestroyDevice: Pancake_destroyDevice,
//            AddDeviceClient: Pancake_addDeviceClient,
//            RemoveDeviceClient: Pancake_removeDeviceClient,
//            PerformDeviceConfigurationChange: Pancake_performDeviceConfigurationChange,
//            AbortDeviceConfigurationChange: Pancake_abortDeviceConfigurationChange,
//            HasProperty: Pancake_hasProperty,
//            IsPropertySettable: Pancake_isPropertySettable,
//            GetPropertyDataSize: Pancake_getPropertyDataSize,
//            GetPropertyData: Pancake_getPropertyData,
//            SetPropertyData: Pancake_setPropertyData,
//            StartIO: Pancake_startIO,
//            StopIO: Pancake_stopIO,
//            GetZeroTimeStamp: Pancake_getZeroTimeStamp,
//            WillDoIOOperation: Pancake_willDoIOOperation,
//            BeginIOOperation: Pancake_beginIOOperation,
//            DoIOOperation: Pancake_doIOOperation,
//            EndIOOperation: Pancake_endIOOperation
//        )
//        pancakeDriverInterfacePointer = withUnsafeMutablePointer(to: &pancakeDriverInterface!) { return $0 }
//        pancakeDriverReference = withUnsafeMutablePointer(to: &pancakeDriverInterfacePointer) { return $0 }
//
//        return pancakeDriverReference
//    }
//
//}
//


func Pancake_Create(allocator: CFAllocator!, requestedTypeUUID: CFUUID!) -> UnsafeMutableRawPointer? {
    guard CFEqual(requestedTypeUUID, kUUID.audioServerPlugInTypeUUID) else {
        assertionFailure()
        return nil
    }
    
    pancakeDriverInterface = AudioServerPlugInDriverInterface(
        _reserved: nil,
        QueryInterface: Pancake_queryInterface,
        AddRef: Pancake_addRef,
        Release: Pancake_release,
        Initialize: Pancake_initialize,
        CreateDevice: Pancake_createDevice,
        DestroyDevice: Pancake_destroyDevice,
        AddDeviceClient: Pancake_addDeviceClient,
        RemoveDeviceClient: Pancake_removeDeviceClient,
        PerformDeviceConfigurationChange: Pancake_performDeviceConfigurationChange,
        AbortDeviceConfigurationChange: Pancake_abortDeviceConfigurationChange,
        HasProperty: Pancake_hasProperty,
        IsPropertySettable: Pancake_isPropertySettable,
        GetPropertyDataSize: Pancake_getPropertyDataSize,
        GetPropertyData: Pancake_getPropertyData,
        SetPropertyData: Pancake_setPropertyData,
        StartIO: Pancake_startIO,
        StopIO: Pancake_stopIO,
        GetZeroTimeStamp: Pancake_getZeroTimeStamp,
        WillDoIOOperation: Pancake_willDoIOOperation,
        BeginIOOperation: Pancake_beginIOOperation,
        DoIOOperation: Pancake_doIOOperation,
        EndIOOperation: Pancake_endIOOperation
    )
    pancakeDriverInterfacePointer = withUnsafeMutablePointer(to: &pancakeDriverInterface!) { return $0 }
    pancakeDriverReference = withUnsafeMutablePointer(to: &pancakeDriverInterfacePointer) { return $0 }
    
    return UnsafeMutableRawPointer(pancakeDriverReference)
}
