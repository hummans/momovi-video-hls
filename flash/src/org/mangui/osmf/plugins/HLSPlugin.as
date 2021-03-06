//-------------------------------------------------------------------------------
// Copyright (c) 2014-2013 NoZAP B.V.
// Copyright (c) 2013 Guillaume du Pontavice (https://github.com/mangui/HLSprovider)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/. */
// 
// Authors:
//     Jeroen Arnoldus
//     Guillaume du Pontavice
//-------------------------------------------------------------------------------

package org.mangui.osmf.plugins
{
  import org.osmf.elements.LoadFromDocumentElement;
  import org.osmf.media.MediaElement;
  import org.osmf.media.MediaFactoryItem;
  import org.osmf.media.MediaFactoryItemType;
  import org.osmf.media.MediaResourceBase;
  import org.osmf.media.PluginInfo;
  import org.osmf.media.URLResource;
    
  public class HLSPlugin extends PluginInfo
  {
    public function HLSPlugin(items:Vector.<MediaFactoryItem>=null, elementCreationNotifFunc:Function=null){
      
      items = new Vector.<MediaFactoryItem>();
      items.push(
        new MediaFactoryItem(
          'org.mangui.osmf.plugins.HLSPlugin',
          canHandleResource,
          createMediaElement,
          MediaFactoryItemType.STANDARD
        )
      );
      
      super(items, elementCreationNotifFunc);
    }
    
		private function canHandleResource(resource:MediaResourceBase):Boolean{
            return HLSLoaderBase.canHandle(resource);
		}
		
		private function createMediaElement():MediaElement{
			return new LoadFromDocumentElement(null, new HLSLoaderBase());
		}
	}
}
