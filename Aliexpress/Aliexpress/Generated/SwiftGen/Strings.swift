// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Alert {
    /// Close
    internal static let close = L10n.tr("Aliexpress-localizable", "alert.close")
    /// Aliexpress
    internal static let title = L10n.tr("Aliexpress-localizable", "alert.title")
  }

  internal enum CategoriesList {
    /// Choose a category
    internal static let title = L10n.tr("Aliexpress-localizable", "categoriesList.title")
    internal enum Title {
      internal enum Id {
        /// Apparel for Men
        internal static let _100003070 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.100003070")
        /// Apparel for Women
        internal static let _100003109 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.100003109")
        /// Weddings & Events
        internal static let _100003235 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.100003235")
        /// Home Improvement
        internal static let _13 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.13")
        /// Tools
        internal static let _1420 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1420")
        /// Home & Garden
        internal static let _15 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.15")
        /// Mother & Kids
        internal static let _1501 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1501")
        /// Furniture
        internal static let _1503 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1503")
        /// Jewelry & Accessories
        internal static let _1509 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1509")
        /// Watches
        internal static let _1511 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1511")
        /// Luggage & Bags
        internal static let _1524 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.1524")
        /// Sports & Entertainment
        internal static let _18 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.18")
        /// Novelty & Special Use
        internal static let _200000875 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.200000875")
        /// Hair Extensions & Wigs
        internal static let _200002489 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.200002489")
        /// 360° Video Cameras & Accessories
        internal static let _200216592 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.200216592")
        /// Office & School
        internal static let _21 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.21")
        /// Toys & Hobbies
        internal static let _26 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.26")
        /// Security & Protection
        internal static let _30 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.30")
        /// Shoes
        internal static let _322 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.322")
        /// Automobiles & Motorcycles
        internal static let _34 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.34")
        /// Consumer Electronics
        internal static let _44 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.44")
        /// Electronic Components & Supplies
        internal static let _502 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.502")
        /// Cellphones & Telecommunications
        internal static let _509 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.509")
        /// Beauty & Health
        internal static let _66 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.66")
        /// Computer & Office
        internal static let _7 = L10n.tr("Aliexpress-localizable", "categoriesList.title.id.7")
      }
    }
  }

  internal enum ProductsList {
    /// Choose a product
    internal static let title = L10n.tr("Aliexpress-localizable", "productsList.title")
  }

  internal enum Tehnical {
    internal enum Error {
      /// An error occured, try again
      internal static let message = L10n.tr("Aliexpress-localizable", "tehnical.error.message")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
