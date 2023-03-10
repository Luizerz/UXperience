//
//  DailyLawWidgetBundle.swift
//  DailyLawWidget
//
//  Created by Luiz Sena on 06/03/23.
//

import WidgetKit
import SwiftUI

@main
struct DailyLawWidgetBundle: WidgetBundle {
    var body: some Widget {
        DailyLawWidget()
        DailyLawWidgetLiveActivity()
    }
}
