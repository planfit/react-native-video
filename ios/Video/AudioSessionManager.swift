import AVFoundation
import Foundation

class AudioSessionManager {
    static let shared = AudioSessionManager()

    private var videoViews = NSHashTable<RCTVideo>.weakObjects()
    private var isAudioSessionActive = false
    private var remoteControlEventsActive = false

    private var isAudioSessionManagementDisabled: Bool {
        // If no views are registered, disable audio session management
        if videoViews.allObjects.isEmpty {
            return true
        }

        return videoViews.allObjects.contains { view in
            return view._disableAudioSessionManagement == true
        }
    }

    private init() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Public API

    func registerView(view: RCTVideo) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    func unregisterView(view: RCTVideo) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    func updateAudioSessionConfiguration() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    // Handle remote control events from NowPlayingInfoCenterManager
    func setRemoteControlEventsActive(_ active: Bool) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    // Notification that a player's properties have changed
    func playerPropertiesChanged(view: RCTVideo) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    // MARK: - Audio Session Configuration

    private func configureForRemoteControlEvents() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    private func configureAudioSession() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    private func determineAudioCategory(
        silentSwitchObey: Bool,
        silentSwitchIgnore: Bool,
        earpiece: Bool,
        pip: Bool,
        backgroundPlayback: Bool,
        notificationControls: Bool
    ) -> AVAudioSession.Category {
        // Handle conflicting settings
        if silentSwitchObey && silentSwitchIgnore {
            print(
                "Warning: Conflicting ignoreSilentSwitch settings found (obey vs ignore) - defaulting to ignore"
            )
            return .playback
        }

        // PiP, background playback, or notification controls require playback category
        if pip || backgroundPlayback || notificationControls || remoteControlEventsActive {
            if silentSwitchObey {
                print(
                    "Warning: ignoreSilentSwitch=obey cannot be used with PiP, backgroundPlayback, or notification controls - using playback category"
                )
            }

            if earpiece {
                print(
                    "Warning: audioOutput=earpiece cannot be used with PiP, backgroundPlayback, or notification controls - using playback category"
                )
            }

            return .playback
        }

        // Earpiece requires playAndRecord
        if earpiece {
            if silentSwitchObey {
                print(
                    "Warning: audioOutput=earpiece cannot be used with ignoreSilentSwitch=obey - using playAndRecord category"
                )
            }
            return .playAndRecord
        }

        // Honor silent switch if requested
        if silentSwitchObey {
            return .ambient
        }

        // Default to playback for most cases
        return .playback
    }

    private func activateAudioSession() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    private func deactivateAudioSession() {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    // MARK: - Notification Handlers

    @objc
    private func handleAudioSessionInterruption(notification: Notification) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }

    @objc
    private func handleAudioRouteChange(notification: Notification) {
        // Planfit-specific stub — prevent iOS AVAudioSession side-effects.
    }
}
