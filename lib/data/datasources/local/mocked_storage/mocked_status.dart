String mockedStatus(String v) {
  switch (v) {
    case 'Air Conditioner':
      return 'Working: 19°C';
    case 'Smart Bulb':
      return 'Dim Light Mode';
    case 'Smart TV':
      return 'Watching Netflix';
    case 'Soundbar':
      return 'Playing: Radiohead - Creep';
    case 'Smart Pet Feeder':
      return 'Last fed 1 hour ago';
    case 'Vacuum Clenaer':
      return 'Cleaning Living Room';
    case 'Smart Wifi Extender':
      return 'Working';
    case 'Curtain':
      return 'Open %80';
    case 'Camera':
      return 'Recording..';
    case 'Phone':
      return 'Connected';
    case 'Computer':
      return 'Connected';
    default:
  }

  return 'Unknown Status';
}
