//
//  SampleData.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

import MapKit

extension SampleData {
    func getData() -> [Airport]{
        return [
            Airport(
                    name: "Hong Kong International Airport",
                    airportLocation: CLLocationCoordinate2D(latitude:22.31401655880972, , longitude:113.91470760455398),
                    loungeList: [
                        Lounge(
                            displayText: "The Pier, First",
                            openingHours:"05:30:00 - 00:30:00",
                            location: " Level 6, Terminal 1, near gates 63",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "The Retreat", description: "Furnished with a daybed, reading light, and privacy curtains", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T08:00:00Z", endTime: "2023-11-18T08:30:00Z", numRemainingSlots: 3),
                                    timeSlot(startTime: "2023-11-18T08:30:00Z", endTime: "2023-11-18T09:00:00Z", numRemainingSlots: 2)
                                ]),
                                Facility(displayName: "Massage service", description: "Calming, personalised massage treatments will help to ease the strains of the day, in preparation for your voyage.", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T08:00:00Z", endTime: "2023-11-18T08:15:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T08:15:00Z", endTime: "2023-11-18T08:30:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T08:30:00Z", endTime: "2023-11-18T08:45:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T08:45:00Z", endTime: "2023-11-18T09:00:00Z", numRemainingSlots: 1)
                                ]),
                                Facility(displayName: "Shower Rooms", description: "Stocked with fluffy towels and premium amenities to freshen up before your flight", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T10:00:00Z", endTime: "2023-11-18T11:00:00Z", numRemainingSlots: 2),
                                    timeSlot(startTime: "2023-11-18T11:00:00Z", endTime: "2023-11-18T12:00:00Z", numRemainingSlots: 3)
                                    timeSlot(startTime: "2023-11-18T12:00:00Z", endTime: "2023-11-18T13:00:00Z", numRemainingSlots: 3),
                                    timeSlot(startTime: "2023-11-18T13:00:00Z", endTime: "2023-11-18T14:00:00Z", numRemainingSlots: 4),
                                    timeSlot(startTime: "2023-11-18T14:00:00Z", endTime: "2023-11-18T15:00:00Z", numRemainingSlots: 1)
                                ]),
                                Facility(displayName: "The Dining Room", description: "Featuring Asian and international food with paired wine"),
                                Facility(displayName: "The Pantry", description: "Offers a generous spread of grab-and-go delicacies"),
                                Facility(displayName: "The Bar", description: "Offers tipple and signature cocktails"),
                                Facility(displayName: "The Bureau", description: "Offers six work suites with iMac computers and high speed Wi-Fi")
                            
                            ],
                            displayDescription: "Experience our First Class lounge, The Pier, where every considered detail evokes a feeling of care and tranquility. At The Retreat, our elegant in-house spa, you’ll enjoy bespoke service and soothing massages—while at The Bar, you’ll be treated to exquisite cocktails unique to The Pier.",
                            loungeLocation: CLLocationCoordinate2D(latitude:22.31426084015667, longitude:113.92528027285356)
                        ),
                        Lounge(
                            displayText: "The Pier, Business",
                            openingHours:"05:30:00 - 00:30:00",
                            location: "Level 6, Terminal 1, near gate 65",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Flavours of China", description: "Satisfy your palate for Chinese comfort foods—sample dim sum, char siu buns, dumplings, and other regional specials."),
                                Facility(displayName: "Teahouse", description: "Offers tipple and signature cocktails"),
                                Facility(displayName: "Deli-style Food Hall", description: "Fine dining"),
                                Facility(displayName: "Shower suites", description: "Offers tipple and signature cocktails", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T08:00:00Z", endTime: "2023-11-18T08:30:00Z", numRemainingSlots: 2),
                                    timeSlot(startTime: "2023-11-18T08:30:00Z", endTime: "2023-11-18T09:00:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T09:00:00Z", endTime: "2023-11-18T09:30:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T09:30:00Z", endTime: "2023-11-18T10:00:00Z", numRemainingSlots: 1)
                                    
                                ]),
                                Facility(displayName: "Relaxation Room", description: "Including phones, printers, and high-speed web access"),
                                Facility(displayName: "Workstations", description: "Equipped with iMac computers and printers, Wi-Fi")
                            ],
                            displayDescription: "Join us at our newest lounge experience, The Deck: pamper yourself before your flight, people-watch from atop, enjoy cocktails and sunset views from The Terrace, or savour your favourite dishes from our signature Noodle Bar.",
                            loungeLocation: CLLocationCoordinate2D(latitude:22.31426084015667, longitude:113.92528027285356)
                        ),
                        Lounge(
                            displayText: "The Wing, First",
                            openingHours:"05:30:00 - Last departure",
                            location: "Level 7, Terminal 1, near gates 1-4",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Cabana & Shower suites", description: "Temperature-controlled Cabana comes with a large bath and rain shower, comfortable day bed, and ample working space with outlets and connectivity. Offers ironing services at the touch of a button", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T08:00:00Z", endTime: "2023-11-18T08:30:00Z", numRemainingSlots: 3),
                                    timeSlot(startTime: "2023-11-18T08:30:00Z", endTime: "2023-11-18T09:00:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T09:00:00Z", endTime: "2023-11-18T09:30:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T09:30:00Z", endTime: "2023-11-18T10:00:00Z", numRemainingSlots: 2)
                                ]),
                                Facility(displayName: "The Haven restaurant", description: "Western and Asian cusines fine dining experience"),
                                Facility(displayName: "Champagne bar", description: "Enjoys a selection of premium champagnes for your welcome drink"),
                                Facility(displayName: "Workstation", description: "Including phones, printers, and high-speed web access"),

                            ],
                            displayDescription: "Experience our exclusive First Class lounge—The Wing, First—conveniently located in the south departures hall transit area, just beyond security. Offering passengers unparalleled privacy, comfort, and service, this is an elegant and relaxing place to unwind before your flight.",
                            loungeLocation: CLLocationCoordinate2D(latitude:22.312989821869934, longitude:113.93562012578701)
                        ),
                        Lounge(
                            displayText: "The Wing, Business",
                            openingHours:"05:30:00 - Last departure",
                            location: "Level 6, Terminal 1 near gates 2",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Noodle Bar", description: "Serving freshly made Asian dishes, such as dan dan noodles, char siu buns, dumplings, and regional specials"),
                                Facility(displayName: "Long Bar", description: "Sip a glass of premium champagne or a fine wine with scenic overlooks of the tarmac"),
                                Facility(displayName: "Coffee Loft", description: "Enjoys a   frothy cappuccino and other specialty beverages with tasty selection of sandwiches, pies, and cookies"),
                                Facility(displayName: "Workstation", description: "Including phones, printers, and high-speed web access"),

                            ],
                            displayDescription: "Discover The Wing, Business, our premium lounge in the south departures hall. From inside this expansive lounge, you’ll find a world of amenities to help you recharge, relax, and catch up with work.",
                            loungeLocation: CLLocationCoordinate2D(latitude:22.315100775435386,  longitude:113.93395654847366)
                        ),
                        Lounge(
                            displayText: "The Deck",
                            openingHours:"05:30:00 - 00:30:00",
                            location: "Level 7, Terminal 1 near Gate 6",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Noodle Bar", description: "Serves a freshly made selection of Asian specialties such as Sichuanese dan dan noodles, Singapore Laksa, and Taiwanese beef noodles,"),
                                Facility(displayName: "The Terrace", description: "Open area balcony with sunset view"),
                                Facility(displayName: "Shower rooms", description: "Equipped with premium bath products and fluffy towels", availableTimeSlots: [
                                    timeSlot(startTime: "2023-11-18T08:00:00Z", endTime: "2023-11-18T08:30:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T08:30:00Z", endTime: "2023-11-18T09:00:00Z", numRemainingSlots: 2),
                                    timeSlot(startTime: "2023-11-18T09:00:00Z", endTime: "2023-11-18T09:30:00Z", numRemainingSlots: 2),
                                    timeSlot(startTime: "2023-11-18T09:30:00Z", endTime: "2023-11-18T10:00:00Z", numRemainingSlots: 2)
                                    timeSlot(startTime: "2023-11-18T10:00:00Z", endTime: "2023-11-18T10:30:00Z", numRemainingSlots: 3),
                                    timeSlot(startTime: "2023-11-18T10:30:00Z", endTime: "2023-11-18T11:00:00Z", numRemainingSlots: 3),
                                    timeSlot(startTime: "2023-11-18T11:00:00Z", endTime: "2023-11-18T11:30:00Z", numRemainingSlots: 1),
                                    timeSlot(startTime: "2023-11-18T11:30:00Z", endTime: "2023-11-18T12:00:00Z", numRemainingSlots: 2)
                                ])

                            ],
                            displayDescription: "Join us at our newest lounge experience, The Deck: pamper yourself before your flight, people-watch from atop, enjoy cocktails and sunset views from The Terrace, or savour your favourite dishes from our signature Noodle Bar.",
                            loungeLocation: CLLocationCoordinate2D(latitude:22.3176351661265,  longitude:113.93365750674663)
                        )
                        
                    ]
                ),
            Airport(
                    name: "Beijing Capital International Airport",
                    airportLocation: CLLocationCoordinate2D(latitude:40.5436387598461, longitude:117.02843769447915),
                    loungeList: [
                        Lounge(
                            displayText: "Cathay Pacific Lounge",
                            openingHours:"04:35:00 - 18:40:00",
                            location: "Terminal 3 Upstairs (Level 3), next to Gate E20",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Food and beverages bar", description: " Buffet style food and buffet bar for your pre-flight meal "),
                                Facility(displayName: "Work stations", description: "Offers quiet working station high speed Wi-Fi")
                            ],
                            displayDescription: "Escape from the hustle and bustle of the Beijing airport at the Cathay Pacific lounge—designed for rest, relaxation, and productivity.",
                            loungeLocation: CLLocationCoordinate2D(latitude:40.05474958521626 , longitude:116.61583800876812)

                        )
                    ]),
            Airport(
                    name: "Haneda Airport",
                    airportLocation: CLLocationCoordinate2D(latitude:35.549607232336285,  longitude:139.77991372344744),
                    loungeList: [
                        Lounge(
                            displayText: "Cathay Pacific Lounge",
                            openingHours:"07:30:00 - 17:00:00",
                            location: "Terminal 3, Level 6",
                            numRaiting: 4.9,
                            availableFacilities: [
                                Facility(displayName: "Noodle Bar", description: "Serves a freshly made selection of Asian specialties such as Sichuanese dan dan noodles, Singapore Laksa, and Taiwanese beef noodles,",
                                Facility(displayName: "Food and beverages bar", description: " Buffet style food and buffet bar for your pre-flight meal "),
                                Facility(displayName: "Work stations", description: "Including phones, printers, and high-speed Wi-Fi access")
                            ],
                            displayDescription: "Welcome to our Haneda Lounge at Tokyo International Airport—designed to engage the senses, and create a true feeling of wellbeing throughout your stay.",
                            loungeLocation: CLLocationCoordinate2D(latitude:35.547887268172275, longitude:139.76833519761811)

                        )
                    ]
                    )
            
    }

}

struct SampleData {
    public let airports: [Airport] = []
    public let lounges: [Lounge] = []
    public let facilities: [Facility] = []
}

