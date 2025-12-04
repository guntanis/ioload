# Usage Examples

## Basic Usage

```bash
# Start ioload with default settings (1 second refresh)
ioload

# Or with explicit Python
python3 ioload.py
```

## Custom Refresh Interval

```bash
# Update every 0.5 seconds (faster updates)
ioload -i 0.5

# Update every 2 seconds (slower updates, less CPU)
ioload --interval 2.0
```

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `←` or `<` | Previous device |
| `→` or `>` | Next device |
| `↑` | Previous chart view |
| `↓` | Next chart view |
| `Q` | Quit |

## Chart Views

1. **IOPS View** - Shows read/write operations per second
2. **Throughput View** - Shows data transfer rates (KB/s, MB/s, etc.)
3. **Utilization View** - Shows device utilization percentage
4. **Wait Times View** - Shows average read/write wait times

## Use Cases

### Monitoring Database Disk I/O

```bash
# Monitor database disk with 0.5s refresh
ioload -i 0.5
# Switch to the database device and watch IOPS
```

### Performance Testing

```bash
# Monitor during load test
ioload -i 1.0
# Watch throughput and utilization during test
```

### Troubleshooting Slow I/O

```bash
# Monitor wait times to identify bottlenecks
ioload
# Switch to Wait Times view (↓ key) to see latency
```

## Tips

- Use smaller intervals (0.5s) for detailed monitoring
- Use larger intervals (2-5s) for long-term monitoring to reduce CPU usage
- Switch between views to get different perspectives on I/O performance
- Monitor multiple devices by switching between them
